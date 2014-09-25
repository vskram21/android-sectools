.class Landroid/support/v7/app/ActionBarActivityDelegateICS;
.super Landroid/support/v7/app/ActionBarActivityDelegate;
.source "ActionBarActivityDelegateICS.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/app/ActionBarActivityDelegateICS$WindowCallbackWrapper;
    }
.end annotation


# instance fields
.field mMenu:Landroid/view/Menu;


# direct methods
.method constructor <init>(Landroid/support/v7/app/ActionBarActivity;)V
    .locals 0
    .parameter "activity"

    .prologue
    .line 42
    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegate;-><init>(Landroid/support/v7/app/ActionBarActivity;)V

    .line 43
    return-void
.end method


# virtual methods
.method public addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1
    .parameter "v"
    .parameter "lp"

    .prologue
    .line 121
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/app/ActionBarActivity;->superAddContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    return-void
.end method

.method public createSupportActionBar()Landroid/support/v7/app/ActionBar;
    .locals 3

    .prologue
    .line 47
    new-instance v0, Landroid/support/v7/app/ActionBarImplICS;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-direct {v0, v1, v2}, Landroid/support/v7/app/ActionBarImplICS;-><init>(Landroid/app/Activity;Landroid/support/v7/app/ActionBar$Callback;)V

    return-object v0
.end method

.method createWindowCallbackWrapper(Landroid/view/Window$Callback;)Landroid/view/Window$Callback;
    .locals 1
    .parameter "cb"

    .prologue
    .line 89
    new-instance v0, Landroid/support/v7/app/ActionBarActivityDelegateICS$WindowCallbackWrapper;

    invoke-direct {v0, p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegateICS$WindowCallbackWrapper;-><init>(Landroid/support/v7/app/ActionBarActivityDelegateICS;Landroid/view/Window$Callback;)V

    return-object v0
.end method

.method public getDrawerToggleDelegate()Landroid/support/v4/app/ActionBarDrawerToggle$Delegate;
    .locals 1

    .prologue
    .line 238
    const/4 v0, 0x0

    return-object v0
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .locals 3
    .parameter "mode"

    .prologue
    .line 221
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    new-instance v1, Landroid/support/v7/internal/view/ActionModeWrapper;

    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateICS;->getActionBarThemedContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Landroid/support/v7/internal/view/ActionModeWrapper;-><init>(Landroid/content/Context;Landroid/view/ActionMode;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBarActivity;->onSupportActionModeFinished(Landroid/support/v7/view/ActionMode;)V

    .line 223
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 3
    .parameter "mode"

    .prologue
    .line 196
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    new-instance v1, Landroid/support/v7/internal/view/ActionModeWrapper;

    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateICS;->getActionBarThemedContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Landroid/support/v7/internal/view/ActionModeWrapper;-><init>(Landroid/content/Context;Landroid/view/ActionMode;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBarActivity;->onSupportActionModeStarted(Landroid/support/v7/view/ActionMode;)V

    .line 198
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 232
    const/4 v0, 0x0

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .parameter "newConfig"

    .prologue
    .line 94
    return-void
.end method

.method public onContentChanged()V
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBarActivity;->onSupportContentChanged()V

    .line 128
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x1

    .line 53
    const-string v1, "splitActionBarWhenNarrow"

    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateICS;->getUiOptionsFromMetadata()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 54
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBarActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v3, v3}, Landroid/view/Window;->setUiOptions(II)V

    .line 58
    :cond_0
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegate;->onCreate(Landroid/os/Bundle;)V

    .line 60
    iget-boolean v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mHasActionBar:Z

    if-eqz v1, :cond_1

    .line 63
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBarActivity;->requestWindowFeature(I)Z

    .line 65
    :cond_1
    iget-boolean v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mOverlayActionBar:Z

    if-eqz v1, :cond_2

    .line 66
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBarActivity;->requestWindowFeature(I)Z

    .line 84
    :cond_2
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBarActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 85
    .local v0, w:Landroid/view/Window;
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/app/ActionBarActivityDelegateICS;->createWindowCallbackWrapper(Landroid/view/Window$Callback;)Landroid/view/Window$Callback;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 86
    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 2
    .parameter "featureId"
    .parameter "menu"

    .prologue
    .line 143
    if-eqz p1, :cond_0

    const/16 v0, 0x8

    if-ne p1, v0, :cond_2

    .line 144
    :cond_0
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mMenu:Landroid/view/Menu;

    if-nez v0, :cond_1

    .line 145
    invoke-static {p2}, Landroid/support/v7/internal/view/menu/MenuWrapperFactory;->createMenuWrapper(Landroid/view/Menu;)Landroid/view/Menu;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mMenu:Landroid/view/Menu;

    .line 147
    :cond_1
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mMenu:Landroid/view/Menu;

    invoke-virtual {v0, p1, v1}, Landroid/support/v7/app/ActionBarActivity;->superOnCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v0

    .line 149
    :goto_0
    return v0

    :cond_2
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/app/ActionBarActivity;->superOnCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v0

    goto :goto_0
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .locals 1
    .parameter "featureId"

    .prologue
    .line 138
    const/4 v0, 0x0

    return-object v0
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 1
    .parameter "featureId"
    .parameter "item"

    .prologue
    .line 162
    if-nez p1, :cond_0

    .line 163
    invoke-static {p2}, Landroid/support/v7/internal/view/menu/MenuWrapperFactory;->createMenuItemWrapper(Landroid/view/MenuItem;)Landroid/view/MenuItem;

    move-result-object p2

    .line 165
    :cond_0
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/app/ActionBarActivity;->superOnMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPostResume()V
    .locals 0

    .prologue
    .line 102
    return-void
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 2
    .parameter "featureId"
    .parameter "view"
    .parameter "menu"

    .prologue
    .line 154
    if-eqz p1, :cond_0

    const/16 v0, 0x8

    if-ne p1, v0, :cond_1

    .line 155
    :cond_0
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mMenu:Landroid/view/Menu;

    invoke-virtual {v0, p1, p2, v1}, Landroid/support/v7/app/ActionBarActivity;->superOnPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    .line 157
    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/app/ActionBarActivity;->superOnPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    goto :goto_0
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 98
    return-void
.end method

.method public onTitleChanged(Ljava/lang/CharSequence;)V
    .locals 0
    .parameter "title"

    .prologue
    .line 171
    return-void
.end method

.method public setContentView(I)V
    .locals 1
    .parameter "resId"

    .prologue
    .line 111
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1}, Landroid/support/v7/app/ActionBarActivity;->superSetContentView(I)V

    .line 112
    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 106
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1}, Landroid/support/v7/app/ActionBarActivity;->superSetContentView(Landroid/view/View;)V

    .line 107
    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1
    .parameter "v"
    .parameter "lp"

    .prologue
    .line 116
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/app/ActionBarActivity;->superSetContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
    return-void
.end method

.method setSupportProgress(I)V
    .locals 1
    .parameter "progress"

    .prologue
    .line 217
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1}, Landroid/support/v7/app/ActionBarActivity;->setProgress(I)V

    .line 218
    return-void
.end method

.method setSupportProgressBarIndeterminate(Z)V
    .locals 1
    .parameter "indeterminate"

    .prologue
    .line 212
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1}, Landroid/support/v7/app/ActionBarActivity;->setProgressBarIndeterminate(Z)V

    .line 213
    return-void
.end method

.method setSupportProgressBarIndeterminateVisibility(Z)V
    .locals 1
    .parameter "visible"

    .prologue
    .line 207
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1}, Landroid/support/v7/app/ActionBarActivity;->setProgressBarIndeterminateVisibility(Z)V

    .line 208
    return-void
.end method

.method setSupportProgressBarVisibility(Z)V
    .locals 1
    .parameter "visible"

    .prologue
    .line 202
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1}, Landroid/support/v7/app/ActionBarActivity;->setProgressBarVisibility(Z)V

    .line 203
    return-void
.end method

.method public startSupportActionMode(Landroid/support/v7/view/ActionMode$Callback;)Landroid/support/v7/view/ActionMode;
    .locals 6
    .parameter "callback"

    .prologue
    .line 175
    if-nez p1, :cond_0

    .line 176
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "ActionMode callback can not be null."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 179
    :cond_0
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateICS;->getActionBarThemedContext()Landroid/content/Context;

    move-result-object v0

    .line 181
    .local v0, context:Landroid/content/Context;
    new-instance v2, Landroid/support/v7/internal/view/ActionModeWrapper$CallbackWrapper;

    invoke-direct {v2, v0, p1}, Landroid/support/v7/internal/view/ActionModeWrapper$CallbackWrapper;-><init>(Landroid/content/Context;Landroid/support/v7/view/ActionMode$Callback;)V

    .line 183
    .local v2, wrappedCallback:Landroid/support/v7/internal/view/ActionModeWrapper$CallbackWrapper;
    const/4 v3, 0x0

    .line 185
    .local v3, wrappedMode:Landroid/support/v7/internal/view/ActionModeWrapper;
    iget-object v4, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v4, v2}, Landroid/support/v7/app/ActionBarActivity;->startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object v1

    .line 187
    .local v1, frameworkMode:Landroid/view/ActionMode;
    if-eqz v1, :cond_1

    .line 188
    new-instance v3, Landroid/support/v7/internal/view/ActionModeWrapper;

    .end local v3           #wrappedMode:Landroid/support/v7/internal/view/ActionModeWrapper;
    invoke-direct {v3, v0, v1}, Landroid/support/v7/internal/view/ActionModeWrapper;-><init>(Landroid/content/Context;Landroid/view/ActionMode;)V

    .line 189
    .restart local v3       #wrappedMode:Landroid/support/v7/internal/view/ActionModeWrapper;
    invoke-virtual {v2, v3}, Landroid/support/v7/internal/view/ActionModeWrapper$CallbackWrapper;->setLastStartedActionMode(Landroid/support/v7/internal/view/ActionModeWrapper;)V

    .line 192
    :cond_1
    return-object v3
.end method

.method public supportInvalidateOptionsMenu()V
    .locals 1

    .prologue
    .line 227
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mMenu:Landroid/view/Menu;

    .line 228
    return-void
.end method

.method public supportRequestWindowFeature(I)Z
    .locals 1
    .parameter "featureId"

    .prologue
    .line 132
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateICS;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1}, Landroid/support/v7/app/ActionBarActivity;->requestWindowFeature(I)Z

    move-result v0

    return v0
.end method
