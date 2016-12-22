# 3BladesApi.DefaultApi

All URIs are relative to *https://virtserver.swaggerhub.com/3Blades/core-backend/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**projectsPost**](DefaultApi.md#projectsPost) | **POST** /projects | Adds a new project
[**projectsProjectIdChangeVisibilityPut**](DefaultApi.md#projectsProjectIdChangeVisibilityPut) | **PUT** /projects/{projectId}/change-visibility | Change the project visibility
[**projectsProjectIdDelete**](DefaultApi.md#projectsProjectIdDelete) | **DELETE** /projects/{projectId} | Deletes a project by ID
[**projectsProjectIdGet**](DefaultApi.md#projectsProjectIdGet) | **GET** /projects/{projectId} | Gets a project by ID
[**projectsProjectIdPut**](DefaultApi.md#projectsProjectIdPut) | **PUT** /projects/{projectId} | Updates project object
[**projectsProjectIdWorkspacesGet**](DefaultApi.md#projectsProjectIdWorkspacesGet) | **GET** /projects/{projectId}/workspaces | 
[**usersGet**](DefaultApi.md#usersGet) | **GET** /users | Gets a list of all users.
[**usersPost**](DefaultApi.md#usersPost) | **POST** /users | Adds a new user
[**usersUserIdDelete**](DefaultApi.md#usersUserIdDelete) | **DELETE** /users/{userId} | Deletes a user by ID
[**usersUserIdGet**](DefaultApi.md#usersUserIdGet) | **GET** /users/{userId} | Gets a user by ID
[**usersUserIdProjectsGet**](DefaultApi.md#usersUserIdProjectsGet) | **GET** /users/{userId}/projects | Gets all the user&#39;s projects
[**usersUserIdPut**](DefaultApi.md#usersUserIdPut) | **PUT** /users/{userId} | Updates user object


<a name="projectsPost"></a>
# **projectsPost**
> projectsPost(opts)

Adds a new project

### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.DefaultApi();

var opts = { 
  'project': new 3BladesApi.Project() // Project | Project to add
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.projectsPost(opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project** | [**Project**](Project.md)| Project to add | [optional] 

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="projectsProjectIdChangeVisibilityPut"></a>
# **projectsProjectIdChangeVisibilityPut**
> projectsProjectIdChangeVisibilityPut(projectId, opts)

Change the project visibility

### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.DefaultApi();

var projectId = "projectId_example"; // String | The project's Id

var opts = { 
  'isPrivate': true // Boolean | Send true If the project will be private
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.projectsProjectIdChangeVisibilityPut(projectId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **String**| The project&#39;s Id | 
 **isPrivate** | **Boolean**| Send true If the project will be private | [optional] 

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="projectsProjectIdDelete"></a>
# **projectsProjectIdDelete**
> projectsProjectIdDelete(projectId)

Deletes a project by ID

### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.DefaultApi();

var projectId = "projectId_example"; // String | The project's Id


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.projectsProjectIdDelete(projectId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **String**| The project&#39;s Id | 

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="projectsProjectIdGet"></a>
# **projectsProjectIdGet**
> projectsProjectIdGet(projectId)

Gets a project by ID

### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.DefaultApi();

var projectId = "projectId_example"; // String | The project's Id


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.projectsProjectIdGet(projectId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **String**| The project&#39;s Id | 

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="projectsProjectIdPut"></a>
# **projectsProjectIdPut**
> projectsProjectIdPut(projectId, opts)

Updates project object

Updates its name or description

### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.DefaultApi();

var projectId = "projectId_example"; // String | The project's Id

var opts = { 
  'project': new 3BladesApi.Project() // Project | Project to add
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.projectsProjectIdPut(projectId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **String**| The project&#39;s Id | 
 **project** | [**Project**](Project.md)| Project to add | [optional] 

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="projectsProjectIdWorkspacesGet"></a>
# **projectsProjectIdWorkspacesGet**
> projectsProjectIdWorkspacesGet(projectId)



### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.DefaultApi();

var projectId = "projectId_example"; // String | The project's Id


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.projectsProjectIdWorkspacesGet(projectId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **String**| The project&#39;s Id | 

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="usersGet"></a>
# **usersGet**
> [User] usersGet()

Gets a list of all users.

### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.DefaultApi();

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.usersGet(callback);
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**[User]**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="usersPost"></a>
# **usersPost**
> usersPost(user)

Adds a new user

### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.DefaultApi();

var user = new 3BladesApi.User(); // User | User definition


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.usersPost(user, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user** | [**User**](User.md)| User definition | 

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="usersUserIdDelete"></a>
# **usersUserIdDelete**
> usersUserIdDelete(userId)

Deletes a user by ID

### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.DefaultApi();

var userId = "userId_example"; // String | The user's Id


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.usersUserIdDelete(userId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The user&#39;s Id | 

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="usersUserIdGet"></a>
# **usersUserIdGet**
> User usersUserIdGet(userId)

Gets a user by ID

### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.DefaultApi();

var userId = "userId_example"; // String | The user's Id


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.usersUserIdGet(userId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The user&#39;s Id | 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="usersUserIdProjectsGet"></a>
# **usersUserIdProjectsGet**
> [Project] usersUserIdProjectsGet(userId)

Gets all the user&#39;s projects

### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.DefaultApi();

var userId = "userId_example"; // String | The user's Id


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.usersUserIdProjectsGet(userId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The user&#39;s Id | 

### Return type

[**[Project]**](Project.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="usersUserIdPut"></a>
# **usersUserIdPut**
> usersUserIdPut(userIduser)

Updates user object

Updates user data

### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.DefaultApi();

var userId = "userId_example"; // String | The user's Id

var user = new 3BladesApi.User(); // User | User definition


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.usersUserIdPut(userIduser, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The user&#39;s Id | 
 **user** | [**User**](User.md)| User definition | 

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

