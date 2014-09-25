.class Lcom/zeapo/pwdstore/GitHandler$2;
.super Ljava/lang/Object;
.source "GitHandler.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/GitHandler;->onCreate(Landroid/os/Bundle;)V
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
    .line 129
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler$2;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .parameter
    .parameter "view"
    .parameter "i"
    .parameter "l"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 132
    .local p1, adapterView:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler$2;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    const v2, 0x7f090044

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/GitHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, selection:Ljava/lang/String;
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler$2;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    #setter for: Lcom/zeapo/pwdstore/GitHandler;->connectionMode:Ljava/lang/String;
    invoke-static {v1, v0}, Lcom/zeapo/pwdstore/GitHandler;->access$202(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/String;)Ljava/lang/String;

    .line 134
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler$2;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    #getter for: Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;
    invoke-static {v1}, Lcom/zeapo/pwdstore/GitHandler;->access$300(Lcom/zeapo/pwdstore/GitHandler;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "git_remote_auth"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 135
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p1, adapterView:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    return-void
.end method
