.class Lcom/zeapo/pwdstore/crypto/PgpHandler$4;
.super Ljava/lang/Object;
.source "PgpHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/crypto/PgpHandler;->encrypt(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 441
    iput-object p1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$4;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 445
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$4;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-virtual {v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/zeapo/pwdstore/UserPreference;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 446
    .local v1, intent:Landroid/content/Intent;
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$4;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-virtual {v2, v1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 451
    .end local v1           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 447
    :catch_0
    move-exception v0

    .line 448
    .local v0, e:Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Exception caught :("

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 449
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
