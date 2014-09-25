.class Lcom/zeapo/pwdstore/GitHandler$8;
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
    .line 425
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler$8;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialogInterface"
    .parameter "i"

    .prologue
    .line 429
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler$8;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/zeapo/pwdstore/GitHandler;->setResult(I)V

    .line 430
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler$8;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-virtual {v0}, Lcom/zeapo/pwdstore/GitHandler;->finish()V

    .line 431
    return-void
.end method
