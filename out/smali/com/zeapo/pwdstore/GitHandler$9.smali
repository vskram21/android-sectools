.class Lcom/zeapo/pwdstore/GitHandler$9;
.super Ljava/lang/Object;
.source "GitHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/GitHandler;->pushOperation(Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;)V
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
    .line 418
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler$9;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialogInterface"
    .parameter "i"

    .prologue
    .line 421
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler$9;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    #getter for: Lcom/zeapo/pwdstore/GitHandler;->activity:Landroid/app/Activity;
    invoke-static {v1}, Lcom/zeapo/pwdstore/GitHandler;->access$100(Lcom/zeapo/pwdstore/GitHandler;)Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/zeapo/pwdstore/UserPreference;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 422
    .local v0, intent:Landroid/content/Intent;
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler$9;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    const/16 v2, 0x66

    invoke-virtual {v1, v0, v2}, Lcom/zeapo/pwdstore/GitHandler;->startActivityForResult(Landroid/content/Intent;I)V

    .line 423
    return-void
.end method
