.class Lcom/zeapo/pwdstore/crypto/PgpHandler$2;
.super Ljava/lang/Object;
.source "PgpHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/crypto/PgpHandler;->showToast(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

.field final synthetic val$message:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 197
    iput-object p1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$2;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    iput-object p2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$2;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 201
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$2;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$2;->val$message:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 204
    return-void
.end method
