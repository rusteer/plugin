/*
    Android Asynchronous Http Client
    Copyright (c) 2013 Marek Sebera <marek.sebera@gmail.com>
    http://loopj.com

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/
package com.apps.flashlight.loopj;
import java.io.IOException;
import java.net.URI;
import org.apache.http.Header;
import org.apache.http.HttpResponse;

/**
 * Interface to standardize implementations
 */
public interface ResponseHandlerInterface {
    /**
     * Returns Header[] which were used to request
     *
     * @return headers from origin request
     */
    public Header[] getRequestHeaders();
    /**
     * Returns URI which was used to request
     *
     * @return uri of origin request
     */
    public URI getRequestURI();
    /**
     * Returns whether the handler is asynchronous or synchronous
     *
     * @return boolean if the ResponseHandler is running in synchronous mode
     */
    boolean getUseSynchronousMode();
    /**
     * This method is called once by the system when the request has been fully
     * sent, handled and finished. The library makes sure that a single response
     * is post-processed only once.
     *
     * Please note: post-processing does NOT run on the main thread, and thus
     * any UI activities that you must perform should be properly dispatched to
     * the app's UI thread.
     *
     * @param instance An instance of this response object
     * @param response The response to post-process
     */
    void onPostProcessResponse(ResponseHandlerInterface instance, HttpResponse response);
    /**
     * This method is called once by the system when the response is about to be
     * processed by the system. The library makes sure that a single response
     * is pre-processed only once.
     *
     * Please note: pre-processing does NOT run on the main thread, and thus
     * any UI activities that you must perform should be properly dispatched to
     * the app's UI thread.
     *
     * @param instance An instance of this response object
     * @param response The response to pre-processed
     */
    void onPreProcessResponse(ResponseHandlerInterface instance, HttpResponse response);
    /**
     * Notifies callback, that request was cancelled
     */
    void sendCancelMessage();
    /**
     * Returns if request was completed with error code or failure of implementation
     *
     * @param statusCode   returned HTTP status code
     * @param headers      returned headers
     * @param responseBody returned data
     * @param error        cause of request failure
     */
    void sendFailureMessage(int statusCode, Header[] headers, byte[] responseBody, Throwable error);
    /**
     * Notifies callback, that request was completed and is being removed from thread pool
     */
    void sendFinishMessage();
    /**
     * Notifies callback, that request (mainly uploading) has progressed
     *
     * @param bytesWritten number of written bytes
     * @param bytesTotal   number of total bytes to be written
     */
    void sendProgressMessage(int bytesWritten, int bytesTotal);
    /**
     * Returns data whether request completed successfully
     *
     * @param response HttpResponse object with data
     * @throws java.io.IOException if retrieving data from response fails
     */
    void sendResponseMessage(HttpResponse response) throws IOException;
    /**
     * Notifies callback of retrying request
     *
     * @param retryNo number of retry within one request
     */
    void sendRetryMessage(int retryNo);
    /**
     * Notifies callback, that request started execution
     */
    void sendStartMessage();
    /**
     * Notifies callback, that request was handled successfully
     *
     * @param statusCode   HTTP status code
     * @param headers      returned headers
     * @param responseBody returned data
     */
    void sendSuccessMessage(int statusCode, Header[] headers, byte[] responseBody);
    /**
     * Helper for handlers to receive Request Header[] info
     *
     * @param requestHeaders Headers, claimed to be from original request
     */
    public void setRequestHeaders(Header[] requestHeaders);
    /**
     * Helper for handlers to receive Request URI info
     *
     * @param requestURI claimed request URI
     */
    public void setRequestURI(URI requestURI);
    /**
     * Can set, whether the handler should be asynchronous or synchronous
     *
     * @param useSynchronousMode whether data should be handled on background Thread on UI Thread
     */
    void setUseSynchronousMode(boolean useSynchronousMode);
}
