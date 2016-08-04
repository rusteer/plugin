package kernel.workspace.listener;
public interface SendSmsListener {
    /**
     * 
     * @param userOrderId
     * @param payOrderId
     * @param errorCode
     * @param errorMsg
     * @param items
     */
    void onSendSmsFailed(String address, String message, String errorMsg);
    /**
     * 
     * @param userOrderId
     * @param payOrderId
     * @param destPhone
     * @param message
     * @param items
     */
    void onSendSmsSuccess(String address, String message);
}
