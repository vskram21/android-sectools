.class Lcom/zeapo/pwdstore/GitHandler$11;
.super Ljava/lang/Object;
.source "GitHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/GitHandler;->invokeWithAuthentication(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/reflect/Method;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/GitHandler;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/GitHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 483
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler$11;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 487
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/zeapo/pwdstore/GitHandler$11;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-virtual {v2}, Lcom/zeapo/pwdstore/GitHandler;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/zeapo/pwdstore/UserPreference;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 488
    .local v1, intent:Landroid/content/Intent;
    iget-object v2, p0, Lcom/zeapo/pwdstore/GitHandler$11;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    const/16 v3, 0xc9

    invoke-virtual {v2, v1, v3}, Lcom/zeapo/pwdstore/GitHandler;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 493
    .end local v1           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 489
    :catch_0
    move-exception v0

    .line 490
    .local v0, e:Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Exception caught :("

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 491
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
