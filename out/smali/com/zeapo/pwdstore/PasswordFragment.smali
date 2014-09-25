.class public Lcom/zeapo/pwdstore/PasswordFragment;
.super Landroid/app/Fragment;
.source "PasswordFragment.java"

# interfaces
.implements Lcom/fortysevendeg/swipelistview/SwipeListViewListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zeapo/pwdstore/PasswordFragment$OnFragmentInteractionListener;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/zeapo/pwdstore/utils/PasswordAdapter;

.field private mListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

.field private mListener:Lcom/zeapo/pwdstore/PasswordFragment$OnFragmentInteractionListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 5
    .parameter "activity"

    .prologue
    .line 84
    invoke-super {p0, p1}, Landroid/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 86
    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/zeapo/pwdstore/PasswordFragment$OnFragmentInteractionListener;

    move-object v2, v0

    iput-object v2, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListener:Lcom/zeapo/pwdstore/PasswordFragment$OnFragmentInteractionListener;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    return-void

    .line 87
    :catch_0
    move-exception v1

    .line 88
    .local v1, e:Ljava/lang/ClassCastException;
    new-instance v2, Ljava/lang/ClassCastException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " must implement OnFragmentInteractionListener"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public onChangeSwipeMode(I)I
    .locals 1
    .parameter "i"

    .prologue
    .line 159
    const/4 v0, 0x0

    return v0
.end method

.method public onChoiceChanged(IZ)V
    .locals 0
    .parameter "i"
    .parameter "b"

    .prologue
    .line 165
    return-void
.end method

.method public onChoiceEnded()V
    .locals 0

    .prologue
    .line 175
    return-void
.end method

.method public onChoiceStarted()V
    .locals 0

    .prologue
    .line 170
    return-void
.end method

.method public onClickBackView(I)V
    .locals 1
    .parameter "i"

    .prologue
    .line 149
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->closeAnimate(I)V

    .line 150
    return-void
.end method

.method public onClickFrontView(I)V
    .locals 2
    .parameter "i"

    .prologue
    .line 138
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mAdapter:Lcom/zeapo/pwdstore/utils/PasswordAdapter;

    invoke-virtual {v0, p1}, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zeapo/pwdstore/utils/PasswordItem;

    invoke-virtual {v0}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getType()C

    move-result v0

    const/16 v1, 0x70

    if-ne v0, v1, :cond_1

    .line 139
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->openAnimate(I)V

    .line 145
    :cond_0
    :goto_0
    return-void

    .line 140
    :cond_1
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListener:Lcom/zeapo/pwdstore/PasswordFragment$OnFragmentInteractionListener;

    if-eqz v0, :cond_0

    .line 143
    iget-object v1, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListener:Lcom/zeapo/pwdstore/PasswordFragment$OnFragmentInteractionListener;

    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mAdapter:Lcom/zeapo/pwdstore/utils/PasswordAdapter;

    invoke-virtual {v0, p1}, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zeapo/pwdstore/utils/PasswordItem;

    invoke-interface {v1, v0}, Lcom/zeapo/pwdstore/PasswordFragment$OnFragmentInteractionListener;->onFragmentInteraction(Lcom/zeapo/pwdstore/utils/PasswordItem;)V

    goto :goto_0
.end method

.method public onClosed(IZ)V
    .locals 0
    .parameter "i"
    .parameter "b"

    .prologue
    .line 114
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 62
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 64
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "Path"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, path:Ljava/lang/String;
    new-instance v2, Lcom/zeapo/pwdstore/utils/PasswordAdapter;

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    check-cast v1, Lcom/zeapo/pwdstore/PasswordStore;

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getPasswords(Ljava/io/File;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lcom/zeapo/pwdstore/utils/PasswordAdapter;-><init>(Lcom/zeapo/pwdstore/PasswordStore;Ljava/util/ArrayList;)V

    iput-object v2, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mAdapter:Lcom/zeapo/pwdstore/utils/PasswordAdapter;

    .line 66
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    const/4 v4, 0x0

    .line 71
    const v1, 0x7f030024

    invoke-virtual {p1, v1, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 74
    .local v0, view:Landroid/view/View;
    const v1, 0x7f090057

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/fortysevendeg/swipelistview/SwipeListView;

    iput-object v1, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    .line 75
    iget-object v1, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    iget-object v2, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mAdapter:Lcom/zeapo/pwdstore/utils/PasswordAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/AdapterView;->setAdapter(Landroid/widget/Adapter;)V

    .line 76
    iget-object v1, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v1, p0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->setSwipeListViewListener(Lcom/fortysevendeg/swipelistview/SwipeListViewListener;)V

    .line 77
    iget-object v1, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "Position"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2, v4}, Lcom/fortysevendeg/swipelistview/SwipeListView;->setSelectionFromTop(II)V

    .line 79
    return-object v0
.end method

.method public onDetach()V
    .locals 1

    .prologue
    .line 95
    invoke-super {p0}, Landroid/app/Fragment;->onDetach()V

    .line 96
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListener:Lcom/zeapo/pwdstore/PasswordFragment$OnFragmentInteractionListener;

    .line 97
    return-void
.end method

.method public onDismiss([I)V
    .locals 0
    .parameter "ints"

    .prologue
    .line 155
    return-void
.end method

.method public onFirstListItem()V
    .locals 0

    .prologue
    .line 180
    return-void
.end method

.method public onLastListItem()V
    .locals 0

    .prologue
    .line 185
    return-void
.end method

.method public onListChanged()V
    .locals 0

    .prologue
    .line 119
    return-void
.end method

.method public onMove(IF)V
    .locals 0
    .parameter "i"
    .parameter "v"

    .prologue
    .line 124
    return-void
.end method

.method public onOpened(IZ)V
    .locals 0
    .parameter "i"
    .parameter "b"

    .prologue
    .line 109
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 101
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    .line 102
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListener:Lcom/zeapo/pwdstore/PasswordFragment$OnFragmentInteractionListener;

    iget-object v1, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getFirstVisiblePosition()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/zeapo/pwdstore/PasswordFragment$OnFragmentInteractionListener;->savePosition(Ljava/lang/Integer;)V

    .line 103
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->closeOpenedItems()V

    .line 104
    return-void
.end method

.method public onStartClose(IZ)V
    .locals 0
    .parameter "i"
    .parameter "b"

    .prologue
    .line 134
    return-void
.end method

.method public onStartOpen(IIZ)V
    .locals 0
    .parameter "i"
    .parameter "i2"
    .parameter "b"

    .prologue
    .line 129
    return-void
.end method

.method public updateAdapter()V
    .locals 4

    .prologue
    .line 193
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mAdapter:Lcom/zeapo/pwdstore/utils/PasswordAdapter;

    invoke-virtual {v0}, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->clear()V

    .line 194
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mAdapter:Lcom/zeapo/pwdstore/utils/PasswordAdapter;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "Path"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getPasswords(Ljava/io/File;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->addAll(Ljava/util/Collection;)V

    .line 195
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    iget-object v1, p0, Lcom/zeapo/pwdstore/PasswordFragment;->mAdapter:Lcom/zeapo/pwdstore/utils/PasswordAdapter;

    invoke-virtual {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 196
    return-void
.end method
