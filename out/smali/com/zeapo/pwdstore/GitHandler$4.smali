.class Lcom/zeapo/pwdstore/GitHandler$4;
.super Ljava/lang/Object;
.source "GitHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/GitHandler;->cloneRepository(Landroid/view/View;)V
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
    .line 323
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler$4;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 325
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 326
    return-void
.end method
