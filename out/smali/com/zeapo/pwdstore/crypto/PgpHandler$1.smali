.class Lcom/zeapo/pwdstore/crypto/PgpHandler$1;
.super Ljava/lang/Object;
.source "PgpHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/crypto/PgpHandler;->handleError(Lorg/openintents/openpgp/OpenPgpError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

.field final synthetic val$error:Lorg/openintents/openpgp/OpenPgpError;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;Lorg/openintents/openpgp/OpenPgpError;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 183
    iput-object p1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$1;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    iput-object p2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$1;->val$error:Lorg/openintents/openpgp/OpenPgpError;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 187
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$1;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onError id:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$1;->val$error:Lorg/openintents/openpgp/OpenPgpError;

    invoke-virtual {v2}, Lorg/openintents/openpgp/OpenPgpError;->getErrorId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$1;->val$error:Lorg/openintents/openpgp/OpenPgpError;

    invoke-virtual {v2}, Lorg/openintents/openpgp/OpenPgpError;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 190
    const-string v0, "Keychain"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onError getErrorId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$1;->val$error:Lorg/openintents/openpgp/OpenPgpError;

    invoke-virtual {v2}, Lorg/openintents/openpgp/OpenPgpError;->getErrorId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    const-string v0, "Keychain"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onError getMessage:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$1;->val$error:Lorg/openintents/openpgp/OpenPgpError;

    invoke-virtual {v2}, Lorg/openintents/openpgp/OpenPgpError;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    return-void
.end method
