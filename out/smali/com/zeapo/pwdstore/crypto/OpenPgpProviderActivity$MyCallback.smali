.class Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;
.super Ljava/lang/Object;
.source "OpenPgpProviderActivity.java"

# interfaces
.implements Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyCallback"
.end annotation


# instance fields
.field os:Ljava/io/ByteArrayOutputStream;

.field requestCode:I

.field returnToCiphertextField:Z

.field final synthetic this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;


# direct methods
.method private constructor <init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;ZLjava/io/ByteArrayOutputStream;I)V
    .locals 0
    .parameter
    .parameter "returnToCiphertextField"
    .parameter "os"
    .parameter "requestCode"

    .prologue
    .line 194
    iput-object p1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 195
    iput-boolean p2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->returnToCiphertextField:Z

    .line 196
    iput-object p3, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->os:Ljava/io/ByteArrayOutputStream;

    .line 197
    iput p4, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->requestCode:I

    .line 198
    return-void
.end method

.method synthetic constructor <init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;ZLjava/io/ByteArrayOutputStream;ILcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 189
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;ZLjava/io/ByteArrayOutputStream;I)V

    return-void
.end method


# virtual methods
.method public onReturn(Landroid/content/Intent;)V
    .locals 14
    .parameter "result"

    .prologue
    const/4 v1, 0x0

    .line 202
    const-string v0, "result_code"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 261
    :cond_0
    :goto_0
    return-void

    .line 204
    :pswitch_0
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    const-string v1, "RESULT_CODE_SUCCESS"

    #calls: Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->access$000(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;Ljava/lang/String;)V

    .line 207
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->os:Ljava/io/ByteArrayOutputStream;

    if-eqz v0, :cond_1

    .line 209
    :try_start_0
    const-string v0, "OpenPgp API"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "result: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->os:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " str="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->os:Ljava/io/ByteArrayOutputStream;

    const-string v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    iget-boolean v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->returnToCiphertextField:Z

    if-eqz v0, :cond_3

    .line 213
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    #getter for: Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mCiphertext:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->access$100(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->os:Ljava/io/ByteArrayOutputStream;

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    :cond_1
    :goto_1
    const-string v0, "signature"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 224
    const-string v0, "signature"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v13

    check-cast v13, Lorg/openintents/openpgp/OpenPgpSignatureResult;

    .line 226
    .local v13, sigResult:Lorg/openintents/openpgp/OpenPgpSignatureResult;
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    invoke-virtual {v13}, Lorg/openintents/openpgp/OpenPgpSignatureResult;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->access$000(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;Ljava/lang/String;)V

    .line 230
    .end local v13           #sigResult:Lorg/openintents/openpgp/OpenPgpSignatureResult;
    :cond_2
    const-string v0, "key_ids"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 231
    const-string v0, "key_ids"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getLongArrayExtra(Ljava/lang/String;)[J

    move-result-object v10

    .line 232
    .local v10, keyIds:[J
    const-string v11, "keyIds: "

    .line 233
    .local v11, out:Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, i:I
    :goto_2
    array-length v0, v10

    if-ge v9, v0, :cond_4

    .line 234
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-wide v1, v10, v9

    invoke-static {v1, v2}, Lorg/openintents/openpgp/util/OpenPgpUtils;->convertKeyIdToHex(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 233
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 215
    .end local v9           #i:I
    .end local v10           #keyIds:[J
    .end local v11           #out:Ljava/lang/String;
    :cond_3
    :try_start_1
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    #getter for: Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mMessage:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->access$200(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->os:Ljava/io/ByteArrayOutputStream;

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 217
    :catch_0
    move-exception v7

    .line 218
    .local v7, e:Ljava/io/UnsupportedEncodingException;
    const-string v0, "Keychain"

    const-string v1, "UnsupportedEncodingException"

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 237
    .end local v7           #e:Ljava/io/UnsupportedEncodingException;
    .restart local v9       #i:I
    .restart local v10       #keyIds:[J
    .restart local v11       #out:Ljava/lang/String;
    :cond_4
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    #calls: Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v11}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->access$000(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 242
    .end local v9           #i:I
    .end local v10           #keyIds:[J
    .end local v11           #out:Ljava/lang/String;
    :pswitch_1
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    const-string v1, "RESULT_CODE_USER_INTERACTION_REQUIRED"

    #calls: Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->access$000(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;Ljava/lang/String;)V

    .line 244
    const-string v0, "intent"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v12

    check-cast v12, Landroid/app/PendingIntent;

    .line 246
    .local v12, pi:Landroid/app/PendingIntent;
    :try_start_2
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    invoke-virtual {v12}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v1

    iget v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->requestCode:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    :try_end_2
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 248
    :catch_1
    move-exception v7

    .line 249
    .local v7, e:Landroid/content/IntentSender$SendIntentException;
    const-string v0, "Keychain"

    const-string v1, "SendIntentException"

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 254
    .end local v7           #e:Landroid/content/IntentSender$SendIntentException;
    .end local v12           #pi:Landroid/app/PendingIntent;
    :pswitch_2
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    const-string v1, "RESULT_CODE_ERROR"

    #calls: Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->access$000(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;Ljava/lang/String;)V

    .line 256
    const-string v0, "error"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Lorg/openintents/openpgp/OpenPgpError;

    .line 257
    .local v8, error:Lorg/openintents/openpgp/OpenPgpError;
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    #calls: Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->handleError(Lorg/openintents/openpgp/OpenPgpError;)V
    invoke-static {v0, v8}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->access$300(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;Lorg/openintents/openpgp/OpenPgpError;)V

    goto/16 :goto_0

    .line 202
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
