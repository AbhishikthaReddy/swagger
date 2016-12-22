# 3BladesApi.PublicOperationsApi

All URIs are relative to *https://virtserver.swaggerhub.com/3Blades/core-backend/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**searchProject**](PublicOperationsApi.md#searchProject) | **GET** /projects | searches projects


<a name="searchProject"></a>
# **searchProject**
> [Project] searchProject(opts)

searches projects

By passing in the appropriate options, you can search for available project in the system 

### Example
```javascript
var 3BladesApi = require('3_blades_api');

var apiInstance = new 3BladesApi.PublicOperationsApi();

var opts = { 
  'searchString': "searchString_example", // String | pass an optional search string for looking up project
  'skip': 56, // Number | number of records to skip for pagination
  'limit': 56 // Number | maximum number of records to return
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.searchProject(opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchString** | **String**| pass an optional search string for looking up project | [optional] 
 **skip** | **Number**| number of records to skip for pagination | [optional] 
 **limit** | **Number**| maximum number of records to return | [optional] 

### Return type

[**[Project]**](Project.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

