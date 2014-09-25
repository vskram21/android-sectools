.class public Lorg/eclipse/jgit/revwalk/RevObjectList;
.super Ljava/util/AbstractList;
.source "RevObjectList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Lorg/eclipse/jgit/revwalk/RevObject;",
        ">",
        "Ljava/util/AbstractList",
        "<TE;>;"
    }
.end annotation


# static fields
.field static final BLOCK_SHIFT:I = 0x8

.field static final BLOCK_SIZE:I = 0x100


# instance fields
.field protected contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

.field protected size:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevObjectList;,"Lorg/eclipse/jgit/revwalk/RevObjectList<TE;>;"
    const/4 v1, 0x0

    .line 77
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 71
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevObjectList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 74
    iput v1, p0, Lorg/eclipse/jgit/revwalk/RevObjectList;->size:I

    .line 79
    return-void
.end method


# virtual methods
.method public bridge synthetic add(ILjava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevObjectList;,"Lorg/eclipse/jgit/revwalk/RevObjectList<TE;>;"
    check-cast p2, Lorg/eclipse/jgit/revwalk/RevObject;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/revwalk/RevObjectList;->add(ILorg/eclipse/jgit/revwalk/RevObject;)V

    return-void
.end method

.method public add(ILorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 5
    .parameter "index"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevObjectList;,"Lorg/eclipse/jgit/revwalk/RevObjectList<TE;>;"
    .local p2, element:Lorg/eclipse/jgit/revwalk/RevObject;,"TE;"
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevObjectList;->size:I

    if-eq p1, v0, :cond_0

    .line 83
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->unsupportedOperationNotAddAtEnd:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/revwalk/RevObjectList;->set(ILorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    .line 87
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevObjectList;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevObjectList;->size:I

    .line 88
    return-void
.end method

.method public clear()V
    .locals 2

    .prologue
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevObjectList;,"Lorg/eclipse/jgit/revwalk/RevObjectList<TE;>;"
    const/4 v1, 0x0

    .line 127
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevObjectList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 128
    iput v1, p0, Lorg/eclipse/jgit/revwalk/RevObjectList;->size:I

    .line 129
    return-void
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevObjectList;,"Lorg/eclipse/jgit/revwalk/RevObjectList<TE;>;"
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevObjectList;->get(I)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    return-object v0
.end method

.method public get(I)Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 5
    .parameter "index"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevObjectList;,"Lorg/eclipse/jgit/revwalk/RevObjectList<TE;>;"
    const/4 v2, 0x0

    .line 110
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevObjectList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 111
    .local v1, s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    iget v3, v1, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shr-int v3, p1, v3

    const/16 v4, 0x400

    if-lt v3, v4, :cond_1

    .line 118
    :cond_0
    :goto_0
    return-object v2

    .line 113
    :cond_1
    :goto_1
    if-eqz v1, :cond_2

    iget v3, v1, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    if-lez v3, :cond_2

    .line 114
    iget v3, v1, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shr-int v0, p1, v3

    .line 115
    .local v0, i:I
    iget v3, v1, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shl-int v3, v0, v3

    sub-int/2addr p1, v3

    .line 116
    iget-object v3, v1, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aget-object v1, v3, v0

    .end local v1           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    check-cast v1, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 117
    .restart local v1       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    goto :goto_1

    .line 118
    .end local v0           #i:I
    :cond_2
    if-eqz v1, :cond_0

    iget-object v2, v1, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aget-object v2, v2, p1

    check-cast v2, Lorg/eclipse/jgit/revwalk/RevObject;

    goto :goto_0
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevObjectList;,"Lorg/eclipse/jgit/revwalk/RevObjectList<TE;>;"
    check-cast p2, Lorg/eclipse/jgit/revwalk/RevObject;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/revwalk/RevObjectList;->set(ILorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    return-object v0
.end method

.method public set(ILorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 7
    .parameter "index"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)TE;"
        }
    .end annotation

    .prologue
    .line 91
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevObjectList;,"Lorg/eclipse/jgit/revwalk/RevObjectList<TE;>;"
    .local p2, element:Lorg/eclipse/jgit/revwalk/RevObject;,"TE;"
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevObjectList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 92
    .local v2, s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    :goto_0
    iget v4, v2, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shr-int v4, p1, v4

    const/16 v5, 0x100

    if-lt v4, v5, :cond_0

    .line 93
    new-instance v3, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    iget v4, v2, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    add-int/lit8 v4, v4, 0x8

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;-><init>(I)V

    .line 94
    .end local v2           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    .local v3, s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    iget-object v4, v3, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lorg/eclipse/jgit/revwalk/RevObjectList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    aput-object v6, v4, v5

    .line 95
    iput-object v3, p0, Lorg/eclipse/jgit/revwalk/RevObjectList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    move-object v2, v3

    .end local v3           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    .restart local v2       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    goto :goto_0

    .line 97
    :cond_0
    :goto_1
    iget v4, v2, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    if-lez v4, :cond_2

    .line 98
    iget v4, v2, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shr-int v0, p1, v4

    .line 99
    .local v0, i:I
    iget v4, v2, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shl-int v4, v0, v4

    sub-int/2addr p1, v4

    .line 100
    iget-object v4, v2, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aget-object v4, v4, v0

    if-nez v4, :cond_1

    .line 101
    iget-object v4, v2, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    new-instance v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    iget v6, v2, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    add-int/lit8 v6, v6, -0x8

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;-><init>(I)V

    aput-object v5, v4, v0

    .line 102
    :cond_1
    iget-object v4, v2, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aget-object v2, v4, v0

    .end local v2           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    check-cast v2, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 103
    .restart local v2       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    goto :goto_1

    .line 104
    .end local v0           #i:I
    :cond_2
    iget-object v4, v2, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aget-object v1, v4, p1

    .line 105
    .local v1, old:Ljava/lang/Object;
    iget-object v4, v2, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aput-object p2, v4, p1

    .line 106
    check-cast v1, Lorg/eclipse/jgit/revwalk/RevObject;

    .end local v1           #old:Ljava/lang/Object;
    return-object v1
.end method

.method public size()I
    .locals 1

    .prologue
    .line 122
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevObjectList;,"Lorg/eclipse/jgit/revwalk/RevObjectList<TE;>;"
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevObjectList;->size:I

    return v0
.end method
