//
//  Response.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

enum Response<T> {
  case success(T)
  case failure(error: ErrorRequest, statusCode: HTTPStatusCode? = nil)
}
