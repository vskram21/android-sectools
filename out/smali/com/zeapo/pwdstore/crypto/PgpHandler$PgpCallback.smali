.class public Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;
.super Ljava/lang/Object;
.source "PgpHandler.java"

# interfaces
.implements Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zeapo/pwdstore/crypto/PgpHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PgpCallback"
.end annotation


# instance fields
.field os:Ljava/io/ByteArrayOutputStream;

.field requestCode:I

.field returnToCiphertextField:Z

.field final synthetic this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;


# direct methods
.method private constructor <init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;ZLjava/io/ByteArrayOutputStream;I)V
    .locals 0
    .parameter
    .parameter "returnToCiphertextField"
    .parameter "os"
    .parameter "requestCode"

    .prologue
    .line 299
    iput-object p1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 300
    iput-boolean p2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->returnToCiphertextField:Z

    .line 301
    iput-object p3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->os:Ljava/io/ByteArrayOutputStream;

    .line 302
    iput p4, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->requestCode:I

    .line 303
    return-void
.end method

.method synthetic constructor <init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;ZLjava/io/ByteArrayOutputStream;ILcom/zeapo/pwdstore/crypto/PgpHandler$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 294
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;-><init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;ZLjava/io/ByteArrayOutputStream;I)V

    return-void
.end method


# virtual methods
.method public onReturn(Landroid/content/Intent;)V
    .locals 20
    .parameter "result"

    .prologue
    .line 308
    const-string v1, "result_code"

    const/4 v2, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 400
    :cond_0
    :goto_0
    return-void

    .line 310
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const-string v2, "SUCCESS"

    #calls: Lcom/zeapo/pwdstore/crypto/PgpHandler;->showToast(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$100(Lcom/zeapo/pwdstore/crypto/PgpHandler;Ljava/lang/String;)V

    .line 313
    move-object/from16 v0, p0

    iget v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->requestCode:I

    const/16 v2, 0x26b9

    if-ne v1, v2, :cond_2

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->os:Ljava/io/ByteArrayOutputStream;

    if-eqz v1, :cond_2

    .line 315
    :try_start_0
    const-string v1, "OpenPgp API"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "result: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->os:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    array-length v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " str="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->os:Ljava/io/ByteArrayOutputStream;

    const-string v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    #getter for: Lcom/zeapo/pwdstore/crypto/PgpHandler;->bindingDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$200(Lcom/zeapo/pwdstore/crypto/PgpHandler;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 320
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->returnToCiphertextField:Z

    if-eqz v1, :cond_4

    .line 321
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v2, 0x7f090048

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 323
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->os:Ljava/io/ByteArrayOutputStream;

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v17

    .line 324
    .local v17, passContent:[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v2, 0x7f09004e

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const/4 v2, 0x0

    aget-object v2, v17, v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 327
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->os:Ljava/io/ByteArrayOutputStream;

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ".*\n"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 328
    .local v11, extraContent:Ljava/lang/String;
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    .line 329
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v2, 0x7f090051

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 332
    :cond_1
    new-instance v1, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-direct {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;-><init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;)V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    .end local v11           #extraContent:Ljava/lang/String;
    .end local v17           #passContent:[Ljava/lang/String;
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->requestCode:I

    const/16 v2, 0x26b7

    if-ne v1, v2, :cond_3

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->os:Ljava/io/ByteArrayOutputStream;

    if-eqz v1, :cond_3

    .line 343
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-virtual {v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "FILE_PATH"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v3, 0x7f090052

    invoke-virtual {v1, v3}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".gpg"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 346
    .local v18, path:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    move-object/from16 v0, v18

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lorg/apache/commons/io/FileUtils;->openOutputStream(Ljava/io/File;)Ljava/io/FileOutputStream;

    move-result-object v16

    .line 347
    .local v16, outputStream:Ljava/io/OutputStream;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->os:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 348
    new-instance v8, Landroid/content/Intent;

    invoke-direct {v8}, Landroid/content/Intent;-><init>()V

    .line 349
    .local v8, data:Landroid/content/Intent;
    const-string v1, "CREATED_FILE"

    move-object/from16 v0, v18

    invoke-virtual {v8, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 350
    const-string v2, "NAME"

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v3, 0x7f090052

    invoke-virtual {v1, v3}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 351
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v8}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->setResult(ILandroid/content/Intent;)V

    .line 352
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-virtual {v1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->finish()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 359
    .end local v8           #data:Landroid/content/Intent;
    .end local v16           #outputStream:Ljava/io/OutputStream;
    .end local v18           #path:Ljava/lang/String;
    :cond_3
    :goto_2
    const-string v1, "key_ids"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 360
    const-string v1, "key_ids"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getLongArrayExtra(Ljava/lang/String;)[J

    move-result-object v13

    .line 361
    .local v13, ids:[J
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 363
    .local v14, keys:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v12, 0x0

    .local v12, i:I
    :goto_3
    array-length v1, v13

    if-ge v12, v1, :cond_5

    .line 364
    aget-wide v1, v13, v12

    invoke-static {v1, v2}, Lorg/openintents/openpgp/util/OpenPgpUtils;->convertKeyIdToHex(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v14, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 363
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 334
    .end local v12           #i:I
    .end local v13           #ids:[J
    .end local v14           #keys:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_4
    :try_start_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->os:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/zeapo/pwdstore/crypto/PgpHandler;->showToast(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$100(Lcom/zeapo/pwdstore/crypto/PgpHandler;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_1

    .line 336
    :catch_0
    move-exception v9

    .line 337
    .local v9, e:Ljava/io/UnsupportedEncodingException;
    const-string v1, "Keychain"

    const-string v2, "UnsupportedEncodingException"

    invoke-static {v1, v2, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 353
    .end local v9           #e:Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v9

    .line 354
    .local v9, e:Ljava/lang/Exception;
    const-string v1, "Keychain"

    const-string v2, "UnsupportedEncodingException"

    invoke-static {v1, v2, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 366
    .end local v9           #e:Ljava/lang/Exception;
    .restart local v12       #i:I
    .restart local v13       #ids:[J
    .restart local v14       #keys:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_5
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const-string v2, ", "

    invoke-static {v14, v2}, Lorg/eclipse/jgit/util/StringUtils;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    #setter for: Lcom/zeapo/pwdstore/crypto/PgpHandler;->keyIDs:Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$302(Lcom/zeapo/pwdstore/crypto/PgpHandler;Ljava/lang/String;)Ljava/lang/String;

    .line 368
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    #getter for: Lcom/zeapo/pwdstore/crypto/PgpHandler;->keyIDs:Ljava/lang/String;
    invoke-static {v1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$300(Lcom/zeapo/pwdstore/crypto/PgpHandler;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    .line 369
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    #getter for: Lcom/zeapo/pwdstore/crypto/PgpHandler;->keyIDs:Ljava/lang/String;
    invoke-static {v1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$300(Lcom/zeapo/pwdstore/crypto/PgpHandler;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_7

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    #getter for: Lcom/zeapo/pwdstore/crypto/PgpHandler;->keyIDs:Ljava/lang/String;
    invoke-static {v1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$300(Lcom/zeapo/pwdstore/crypto/PgpHandler;)Ljava/lang/String;

    move-result-object v15

    .line 371
    .local v15, mKeys:Ljava/lang/String;
    :goto_4
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    iget-object v1, v1, Lcom/zeapo/pwdstore/crypto/PgpHandler;->settings:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "openpgp_key_ids"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    #getter for: Lcom/zeapo/pwdstore/crypto/PgpHandler;->keyIDs:Ljava/lang/String;
    invoke-static {v3}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$300(Lcom/zeapo/pwdstore/crypto/PgpHandler;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 372
    const-string v1, "PGP"

    invoke-static {v1, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    .end local v15           #mKeys:Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->setResult(I)V

    .line 375
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-virtual {v1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->finish()V

    goto/16 :goto_0

    .line 369
    :cond_7
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    #getter for: Lcom/zeapo/pwdstore/crypto/PgpHandler;->keyIDs:Ljava/lang/String;
    invoke-static {v1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$300(Lcom/zeapo/pwdstore/crypto/PgpHandler;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v15, v1, v2

    goto :goto_4

    .line 380
    .end local v12           #i:I
    .end local v13           #ids:[J
    .end local v14           #keys:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :pswitch_1
    const-string v1, "PgpHandler"

    const-string v2, "RESULT_CODE_USER_INTERACTION_REQUIRED"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    const-string v1, "intent"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v19

    check-cast v19, Landroid/app/PendingIntent;

    .line 384
    .local v19, pi:Landroid/app/PendingIntent;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-virtual/range {v19 .. v19}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->requestCode:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v1 .. v7}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    :try_end_3
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_0

    .line 386
    :catch_2
    move-exception v9

    .line 387
    .local v9, e:Landroid/content/IntentSender$SendIntentException;
    const-string v1, "Keychain"

    const-string v2, "SendIntentException"

    invoke-static {v1, v2, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 392
    .end local v9           #e:Landroid/content/IntentSender$SendIntentException;
    .end local v19           #pi:Landroid/app/PendingIntent;
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const-string v2, "ERROR"

    #calls: Lcom/zeapo/pwdstore/crypto/PgpHandler;->showToast(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$100(Lcom/zeapo/pwdstore/crypto/PgpHandler;Ljava/lang/String;)V

    .line 394
    const-string v1, "error"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v10

    check-cast v10, Lorg/openintents/openpgp/OpenPgpError;

    .line 395
    .local v10, error:Lorg/openintents/openpgp/OpenPgpError;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    #calls: Lcom/zeapo/pwdstore/crypto/PgpHandler;->handleError(Lorg/openintents/openpgp/OpenPgpError;)V
    invoke-static {v1, v10}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$400(Lcom/zeapo/pwdstore/crypto/PgpHandler;Lorg/openintents/openpgp/OpenPgpError;)V

    goto/16 :goto_0

    .line 308
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
