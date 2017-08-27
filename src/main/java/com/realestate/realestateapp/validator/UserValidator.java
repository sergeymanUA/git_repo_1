package com.realestate.realestateapp.validator;

import com.realestate.realestateapp.model.User;
import com.realestate.realestateapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Component
public class UserValidator implements Validator {

    private static final String EMAIL_PATTERN =
            "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                    + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    private static final int MIN_ALLOWED_USER_FIELD_LENGTH = 8;
    private static final int MAX_ALLOWED_USER_FIELD_LENGTH = 32;

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        validateUserName(user.getUsername(), errors);

        validateUserPassword(user.getPassword(), user.getConfirmPassword(), errors);

        validateUserEmail(user.getEmail(), errors);
    }

    private void validateUserName(String userName, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "Required");
        int userNameLength = userName.length();
        if ((userNameLength < MIN_ALLOWED_USER_FIELD_LENGTH) || (userNameLength > MAX_ALLOWED_USER_FIELD_LENGTH)) {
            errors.rejectValue("username", "Size.userForm.username");
        }

        if (userService.findByUsername(userName) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }
    }

    private void validateUserPassword(String userPassword, String confirmPassword, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Required");
        int userPasswordLength = userPassword.length();
        if ((userPasswordLength < MIN_ALLOWED_USER_FIELD_LENGTH) || (userPasswordLength > MAX_ALLOWED_USER_FIELD_LENGTH)) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!confirmPassword.equals(userPassword)) {
            errors.rejectValue("confirmPassword", "Different.userForm.password");
        }
    }

    private void validateUserEmail(String userEmail, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "Required");

        if (userService.findByEmail(userEmail) != null) {
            errors.rejectValue("email", "Duplicate.userForm.email");
        }

        if (!Pattern.compile(EMAIL_PATTERN).matcher(userEmail).matches()) {
            errors.rejectValue("email", "Invalid.userForm.email");
        }

        int userEmailLength = userEmail.length();
        if ((userEmailLength < MIN_ALLOWED_USER_FIELD_LENGTH) || (userEmailLength > MAX_ALLOWED_USER_FIELD_LENGTH)) {
            errors.rejectValue("email", "Size.userForm.email");
        }
    }
}
