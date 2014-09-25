.class final Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
.super Ljava/lang/Object;
.source "BlockRevQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/BlockRevQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Block"
.end annotation


# static fields
.field static final BLOCK_SIZE:I = 0x100


# instance fields
.field final commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

.field headIndex:I

.field next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

.field tailIndex:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    const/16 v0, 0x100

    new-array v0, v0, [Lorg/eclipse/jgit/revwalk/RevCommit;

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    return-void
.end method


# virtual methods
.method add(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 3
    .parameter "c"

    .prologue
    .line 140
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    iget v1, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    aput-object p1, v0, v1

    .line 141
    return-void
.end method

.method canUnpop()Z
    .locals 1

    .prologue
    .line 136
    iget v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method clear()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 156
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 157
    iput v1, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    .line 158
    iput v1, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    .line 159
    return-void
.end method

.method isEmpty()Z
    .locals 2

    .prologue
    .line 132
    iget v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    iget v1, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isFull()Z
    .locals 2

    .prologue
    .line 128
    iget v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method peek()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 2

    .prologue
    .line 152
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    iget v1, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method pop()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 3

    .prologue
    .line 148
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    iget v1, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method resetToEnd()V
    .locals 1

    .prologue
    .line 166
    const/16 v0, 0x100

    iput v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    iput v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    .line 167
    return-void
.end method

.method resetToMiddle()V
    .locals 1

    .prologue
    .line 162
    const/16 v0, 0x80

    iput v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    iput v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    .line 163
    return-void
.end method

.method unpop(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 2
    .parameter "c"

    .prologue
    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    iget v1, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    aput-object p1, v0, v1

    .line 145
    return-void
.end method
