.class public Lcom/zeapo/pwdstore/utils/PasswordAdapter;
.super Landroid/widget/ArrayAdapter;
.source "PasswordAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/zeapo/pwdstore/utils/PasswordItem;",
        ">;"
    }
.end annotation


# instance fields
.field private final activity:Lcom/zeapo/pwdstore/PasswordStore;

.field private final values:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/zeapo/pwdstore/utils/PasswordItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/zeapo/pwdstore/PasswordStore;Ljava/util/ArrayList;)V
    .locals 1
    .parameter "activity"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zeapo/pwdstore/PasswordStore;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/zeapo/pwdstore/utils/PasswordItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p2, values:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/zeapo/pwdstore/utils/PasswordItem;>;"
    const v0, 0x7f030022

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 40
    iput-object p2, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->values:Ljava/util/ArrayList;

    .line 41
    iput-object p1, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->activity:Lcom/zeapo/pwdstore/PasswordStore;

    .line 42
    return-void
.end method

.method static synthetic access$000(Lcom/zeapo/pwdstore/utils/PasswordAdapter;)Lcom/zeapo/pwdstore/PasswordStore;
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-object v0, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->activity:Lcom/zeapo/pwdstore/PasswordStore;

    return-object v0
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .parameter "i"
    .parameter "convertView"
    .parameter "viewGroup"

    .prologue
    const/4 v9, 0x0

    .line 47
    move-object v4, p2

    .line 48
    .local v4, rowView:Landroid/view/View;
    iget-object v6, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->values:Ljava/util/ArrayList;

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/zeapo/pwdstore/utils/PasswordItem;

    .line 51
    .local v3, pass:Lcom/zeapo/pwdstore/utils/PasswordItem;
    if-nez v4, :cond_0

    .line 52
    iget-object v6, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->activity:Lcom/zeapo/pwdstore/PasswordStore;

    const-string v7, "layout_inflater"

    invoke-virtual {v6, v7}, Lcom/zeapo/pwdstore/PasswordStore;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 54
    .local v1, inflater:Landroid/view/LayoutInflater;
    const v6, 0x7f030022

    invoke-virtual {v1, v6, p3, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 56
    new-instance v5, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;

    invoke-direct {v5}, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;-><init>()V

    .line 57
    .local v5, viewHolder:Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;
    const v6, 0x7f090071

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v5, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->name:Landroid/widget/TextView;

    .line 58
    const v6, 0x7f09006f

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v5, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->back_name:Landroid/widget/TextView;

    .line 59
    const v6, 0x7f090070

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v5, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->type:Landroid/widget/TextView;

    .line 60
    invoke-virtual {v4, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 63
    .end local v1           #inflater:Landroid/view/LayoutInflater;
    .end local v5           #viewHolder:Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;
    :cond_0
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;

    .line 65
    .local v0, holder:Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;
    iget-object v6, v0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->name:Landroid/widget/TextView;

    invoke-virtual {v3}, Lcom/zeapo/pwdstore/utils/PasswordItem;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    iget-object v6, v0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->back_name:Landroid/widget/TextView;

    invoke-virtual {v3}, Lcom/zeapo/pwdstore/utils/PasswordItem;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    invoke-virtual {v3}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getType()C

    move-result v6

    const/16 v7, 0x63

    if-ne v6, v7, :cond_1

    .line 69
    iget-object v6, v0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->name:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->activity:Lcom/zeapo/pwdstore/PasswordStore;

    invoke-virtual {v7}, Lcom/zeapo/pwdstore/PasswordStore;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x1060013

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    iget-object v6, v0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->name:Landroid/widget/TextView;

    sget-object v7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v8, 0x1

    invoke-static {v7, v8}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 71
    iget-object v6, v0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->type:Landroid/widget/TextView;

    const-string v7, "Category: "

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    :goto_0
    return-object v4

    .line 73
    :cond_1
    iget-object v6, v0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->type:Landroid/widget/TextView;

    const-string v7, "Password: "

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    iget-object v6, v0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->name:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->activity:Lcom/zeapo/pwdstore/PasswordStore;

    invoke-virtual {v7}, Lcom/zeapo/pwdstore/PasswordStore;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x1060019

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    iget-object v6, v0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->name:Landroid/widget/TextView;

    sget-object v7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-static {v7, v9}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 77
    iget-object v6, v0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->back_name:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->activity:Lcom/zeapo/pwdstore/PasswordStore;

    invoke-virtual {v7}, Lcom/zeapo/pwdstore/PasswordStore;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x106000b

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    iget-object v6, v0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$ViewHolder;->back_name:Landroid/widget/TextView;

    sget-object v7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v8, 0x3

    invoke-static {v7, v8}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 81
    new-instance v2, Lcom/zeapo/pwdstore/utils/PasswordAdapter$1;

    invoke-direct {v2, p0, v3}, Lcom/zeapo/pwdstore/utils/PasswordAdapter$1;-><init>(Lcom/zeapo/pwdstore/utils/PasswordAdapter;Lcom/zeapo/pwdstore/utils/PasswordItem;)V

    .line 95
    .local v2, onClickListener:Landroid/view/View$OnClickListener;
    const v6, 0x7f090047

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageButton;

    invoke-virtual {v6, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    const v6, 0x7f09004b

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageButton;

    invoke-virtual {v6, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method
