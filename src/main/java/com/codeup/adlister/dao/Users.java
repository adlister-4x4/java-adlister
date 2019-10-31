package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    User findEmail(String email);
    Long insert(User user);

    List<User> findUserByAdId(String userId);
}
