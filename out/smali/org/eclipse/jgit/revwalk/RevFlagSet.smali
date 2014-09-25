.class public Lorg/eclipse/jgit/revwalk/RevFlagSet;
.super Ljava/util/AbstractSet;
.source "RevFlagSet.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet",
        "<",
        "Lorg/eclipse/jgit/revwalk/RevFlag;",
        ">;"
    }
.end annotation


# instance fields
.field private final active:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevFlag;",
            ">;"
        }
    .end annotation
.end field

.field mask:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->active:Ljava/util/List;

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevFlag;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p1, s:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/revwalk/RevFlag;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/RevFlagSet;-><init>()V

    .line 86
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevFlagSet;->addAll(Ljava/util/Collection;)Z

    .line 87
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V
    .locals 2
    .parameter "s"

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 74
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lorg/eclipse/jgit/revwalk/RevFlagSet;->active:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->active:Ljava/util/List;

    .line 76
    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 57
    check-cast p1, Lorg/eclipse/jgit/revwalk/RevFlag;

    .end local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevFlagSet;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v0

    return v0
.end method

.method public add(Lorg/eclipse/jgit/revwalk/RevFlag;)Z
    .locals 3
    .parameter "flag"

    .prologue
    .line 107
    iget v1, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    iget v2, p1, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    .line 108
    const/4 v1, 0x0

    .line 114
    :goto_0
    return v1

    .line 109
    :cond_0
    iget v1, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    iget v2, p1, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    or-int/2addr v1, v2

    iput v1, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    .line 110
    const/4 v0, 0x0

    .line 111
    .local v0, p:I
    :goto_1
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->active:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->active:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/revwalk/RevFlag;

    iget v1, v1, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    iget v2, p1, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    if-ge v1, v2, :cond_1

    .line 112
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 113
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->active:Ljava/util/List;

    invoke-interface {v1, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 114
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 3
    .parameter "o"

    .prologue
    const/4 v0, 0x0

    .line 91
    instance-of v1, p1, Lorg/eclipse/jgit/revwalk/RevFlag;

    if-eqz v1, :cond_0

    .line 92
    iget v1, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    check-cast p1, Lorg/eclipse/jgit/revwalk/RevFlag;

    .end local p1
    iget v2, p1, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 93
    :cond_0
    return v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 98
    .local p1, c:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    instance-of v1, p1, Lorg/eclipse/jgit/revwalk/RevFlagSet;

    if-eqz v1, :cond_1

    .line 99
    check-cast p1, Lorg/eclipse/jgit/revwalk/RevFlagSet;

    .end local p1           #c:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    .line 100
    .local v0, cMask:I
    iget v1, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    and-int/2addr v1, v0

    if-ne v1, v0, :cond_0

    const/4 v1, 0x1

    .line 102
    .end local v0           #cMask:I
    :goto_0
    return v1

    .line 100
    .restart local v0       #cMask:I
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 102
    .end local v0           #cMask:I
    .restart local p1       #c:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    :cond_1
    invoke-super {p0, p1}, Ljava/util/AbstractSet;->containsAll(Ljava/util/Collection;)Z

    move-result v1

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevFlag;",
            ">;"
        }
    .end annotation

    .prologue
    .line 131
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->active:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 132
    .local v0, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/revwalk/RevFlag;>;"
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevFlagSet$1;

    invoke-direct {v1, p0, v0}, Lorg/eclipse/jgit/revwalk/RevFlagSet$1;-><init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 4
    .parameter "o"

    .prologue
    .line 119
    move-object v0, p1

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 120
    .local v0, flag:Lorg/eclipse/jgit/revwalk/RevFlag;
    iget v2, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    iget v3, v0, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    and-int/2addr v2, v3

    if-nez v2, :cond_0

    .line 121
    const/4 v2, 0x0

    .line 126
    :goto_0
    return v2

    .line 122
    :cond_0
    iget v2, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    iget v3, v0, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    xor-int/lit8 v3, v3, -0x1

    and-int/2addr v2, v3

    iput v2, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    .line 123
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->active:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 124
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->active:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/revwalk/RevFlag;

    iget v2, v2, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    iget v3, v0, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    if-ne v2, v3, :cond_1

    .line 125
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->active:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 123
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 126
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->active:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
