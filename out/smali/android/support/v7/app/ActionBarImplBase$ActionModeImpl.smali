.class Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;
.super Landroid/support/v7/view/ActionMode;
.source "ActionBarImplBase.java"

# interfaces
.implements Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/ActionBarImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ActionModeImpl"
.end annotation


# instance fields
.field private mCallback:Landroid/support/v7/view/ActionMode$Callback;

.field private mCustomView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

.field final synthetic this$0:Landroid/support/v7/app/ActionBarImplBase;


# direct methods
.method public constructor <init>(Landroid/support/v7/app/ActionBarImplBase;Landroid/support/v7/view/ActionMode$Callback;)V
    .locals 2
    .parameter
    .parameter "callback"

    .prologue
    .line 736
    iput-object p1, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    invoke-direct {p0}, Landroid/support/v7/view/ActionMode;-><init>()V

    .line 737
    iput-object p2, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    .line 738
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {p1}, Landroid/support/v7/app/ActionBarImplBase;->getThemedContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->setDefaultShowAsAction(I)Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 740
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->setCallback(Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;)V

    .line 741
    return-void
.end method


# virtual methods
.method public dispatchOnCreate()Z
    .locals 2

    .prologue
    .line 793
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 795
    :try_start_0
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-interface {v0, p0, v1}, Landroid/support/v7/view/ActionMode$Callback;->onCreateActionMode(Landroid/support/v7/view/ActionMode;Landroid/view/Menu;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 797
    iget-object v1, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    return v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    throw v0
.end method

.method public finish()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 755
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    iget-object v0, v0, Landroid/support/v7/app/ActionBarImplBase;->mActionMode:Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;

    if-eq v0, p0, :cond_0

    .line 780
    :goto_0
    return-void

    .line 764
    :cond_0
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mHiddenByApp:Z
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$200(Landroid/support/v7/app/ActionBarImplBase;)Z

    move-result v0

    iget-object v1, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mHiddenBySystem:Z
    invoke-static {v1}, Landroid/support/v7/app/ActionBarImplBase;->access$300(Landroid/support/v7/app/ActionBarImplBase;)Z

    move-result v1

    #calls: Landroid/support/v7/app/ActionBarImplBase;->checkShowingFlags(ZZZ)Z
    invoke-static {v0, v1, v2}, Landroid/support/v7/app/ActionBarImplBase;->access$400(ZZZ)Z

    move-result v0

    if-nez v0, :cond_1

    .line 767
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    iput-object p0, v0, Landroid/support/v7/app/ActionBarImplBase;->mDeferredDestroyActionMode:Landroid/support/v7/view/ActionMode;

    .line 768
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    iput-object v1, v0, Landroid/support/v7/app/ActionBarImplBase;->mDeferredModeDestroyCallback:Landroid/support/v7/view/ActionMode$Callback;

    .line 772
    :goto_1
    iput-object v3, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    .line 773
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    invoke-virtual {v0, v2}, Landroid/support/v7/app/ActionBarImplBase;->animateToMode(Z)V

    .line 776
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$500(Landroid/support/v7/app/ActionBarImplBase;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->closeMode()V

    .line 777
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mActionView:Landroid/support/v7/internal/widget/ActionBarView;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$600(Landroid/support/v7/app/ActionBarImplBase;)Landroid/support/v7/internal/widget/ActionBarView;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ActionBarView;->sendAccessibilityEvent(I)V

    .line 779
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    iput-object v3, v0, Landroid/support/v7/app/ActionBarImplBase;->mActionMode:Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;

    goto :goto_0

    .line 770
    :cond_1
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    invoke-interface {v0, p0}, Landroid/support/v7/view/ActionMode$Callback;->onDestroyActionMode(Landroid/support/v7/view/ActionMode;)V

    goto :goto_1
.end method

.method public getCustomView()Landroid/view/View;
    .locals 1

    .prologue
    .line 850
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCustomView:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCustomView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getMenu()Landroid/view/Menu;
    .locals 1

    .prologue
    .line 750
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    return-object v0
.end method

.method public getMenuInflater()Landroid/view/MenuInflater;
    .locals 2

    .prologue
    .line 745
    new-instance v0, Landroid/support/v7/internal/view/SupportMenuInflater;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBarImplBase;->getThemedContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/internal/view/SupportMenuInflater;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public getSubtitle()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 834
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$500(Landroid/support/v7/app/ActionBarImplBase;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 829
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$500(Landroid/support/v7/app/ActionBarImplBase;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public invalidate()V
    .locals 2

    .prologue
    .line 784
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 786
    :try_start_0
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-interface {v0, p0, v1}, Landroid/support/v7/view/ActionMode$Callback;->onPrepareActionMode(Landroid/support/v7/view/ActionMode;Landroid/view/Menu;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 788
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 790
    return-void

    .line 788
    :catchall_0
    move-exception v0

    iget-object v1, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    throw v0
.end method

.method public isTitleOptional()Z
    .locals 1

    .prologue
    .line 845
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$500(Landroid/support/v7/app/ActionBarImplBase;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->isTitleOptional()Z

    move-result v0

    return v0
.end method

.method public onCloseMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;Z)V
    .locals 0
    .parameter "menu"
    .parameter "allMenusAreClosing"

    .prologue
    .line 871
    return-void
.end method

.method public onCloseSubMenu(Landroid/support/v7/internal/view/menu/SubMenuBuilder;)V
    .locals 0
    .parameter "menu"

    .prologue
    .line 887
    return-void
.end method

.method public onMenuItemSelected(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "menu"
    .parameter "item"

    .prologue
    .line 854
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    if-eqz v0, :cond_0

    .line 855
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    invoke-interface {v0, p0, p2}, Landroid/support/v7/view/ActionMode$Callback;->onActionItemClicked(Landroid/support/v7/view/ActionMode;Landroid/view/MenuItem;)Z

    move-result v0

    .line 857
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onMenuModeChange(Landroid/support/v7/internal/view/menu/MenuBuilder;)V
    .locals 1
    .parameter "menu"

    .prologue
    .line 863
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    if-nez v0, :cond_0

    .line 868
    :goto_0
    return-void

    .line 866
    :cond_0
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->invalidate()V

    .line 867
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$500(Landroid/support/v7/app/ActionBarImplBase;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->showOverflowMenu()Z

    goto :goto_0
.end method

.method public onMenuModeChange(Landroid/view/Menu;)V
    .locals 1
    .parameter "menu"

    .prologue
    .line 890
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    if-nez v0, :cond_0

    .line 895
    :goto_0
    return-void

    .line 893
    :cond_0
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->invalidate()V

    .line 894
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$500(Landroid/support/v7/app/ActionBarImplBase;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->showOverflowMenu()Z

    goto :goto_0
.end method

.method public onSubMenuSelected(Landroid/support/v7/internal/view/menu/SubMenuBuilder;)Z
    .locals 2
    .parameter "subMenu"

    .prologue
    const/4 v0, 0x1

    .line 874
    iget-object v1, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    if-nez v1, :cond_1

    .line 875
    const/4 v0, 0x0

    .line 883
    :cond_0
    :goto_0
    return v0

    .line 878
    :cond_1
    invoke-virtual {p1}, Landroid/support/v7/internal/view/menu/SubMenuBuilder;->hasVisibleItems()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0
.end method

.method public setCustomView(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 803
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$500(Landroid/support/v7/app/ActionBarImplBase;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/ActionBarContextView;->setCustomView(Landroid/view/View;)V

    .line 804
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->mCustomView:Ljava/lang/ref/WeakReference;

    .line 805
    return-void
.end method

.method public setSubtitle(I)V
    .locals 1
    .parameter "resId"

    .prologue
    .line 824
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mContext:Landroid/content/Context;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$100(Landroid/support/v7/app/ActionBarImplBase;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 825
    return-void
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .locals 1
    .parameter "subtitle"

    .prologue
    .line 809
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$500(Landroid/support/v7/app/ActionBarImplBase;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/ActionBarContextView;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 810
    return-void
.end method

.method public setTitle(I)V
    .locals 1
    .parameter "resId"

    .prologue
    .line 819
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mContext:Landroid/content/Context;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$100(Landroid/support/v7/app/ActionBarImplBase;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->setTitle(Ljava/lang/CharSequence;)V

    .line 820
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1
    .parameter "title"

    .prologue
    .line 814
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$500(Landroid/support/v7/app/ActionBarImplBase;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/ActionBarContextView;->setTitle(Ljava/lang/CharSequence;)V

    .line 815
    return-void
.end method

.method public setTitleOptionalHint(Z)V
    .locals 1
    .parameter "titleOptional"

    .prologue
    .line 839
    invoke-super {p0, p1}, Landroid/support/v7/view/ActionMode;->setTitleOptionalHint(Z)V

    .line 840
    iget-object v0, p0, Landroid/support/v7/app/ActionBarImplBase$ActionModeImpl;->this$0:Landroid/support/v7/app/ActionBarImplBase;

    #getter for: Landroid/support/v7/app/ActionBarImplBase;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/app/ActionBarImplBase;->access$500(Landroid/support/v7/app/ActionBarImplBase;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/ActionBarContextView;->setTitleOptional(Z)V

    .line 841
    return-void
.end method
