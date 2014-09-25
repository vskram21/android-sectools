.class Lorg/eclipse/jgit/internal/storage/pack/IntSet;
.super Ljava/lang/Object;
.source "IntSet.java"


# instance fields
.field private cnt:I

.field private set:[I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/16 v0, 0x40

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->set:[I

    .line 53
    return-void
.end method


# virtual methods
.method add(I)Z
    .locals 9
    .parameter "key"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 56
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->cnt:I

    .line 57
    .local v0, high:I
    const/4 v1, 0x0

    .line 59
    .local v1, low:I
    if-nez v0, :cond_0

    .line 60
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->set:[I

    aput p1, v6, v5

    .line 61
    iput v4, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->cnt:I

    .line 85
    :goto_0
    return v4

    .line 66
    :cond_0
    add-int v6, v1, v0

    ushr-int/lit8 v3, v6, 0x1

    .line 67
    .local v3, p:I
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->set:[I

    aget v6, v6, v3

    if-ge p1, v6, :cond_3

    .line 68
    move v0, v3

    .line 73
    :goto_1
    if-lt v1, v0, :cond_0

    .line 75
    iget v6, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->cnt:I

    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->set:[I

    array-length v7, v7

    if-ne v6, v7, :cond_1

    .line 76
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->set:[I

    array-length v6, v6

    mul-int/lit8 v6, v6, 0x2

    new-array v2, v6, [I

    .line 77
    .local v2, n:[I
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->set:[I

    iget v7, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->cnt:I

    invoke-static {v6, v5, v2, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->set:[I

    .line 81
    .end local v2           #n:[I
    :cond_1
    iget v5, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->cnt:I

    if-ge v1, v5, :cond_2

    .line 82
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->set:[I

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->set:[I

    add-int/lit8 v7, v1, 0x1

    iget v8, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->cnt:I

    sub-int/2addr v8, v1

    invoke-static {v5, v1, v6, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 83
    :cond_2
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->set:[I

    aput p1, v5, v1

    .line 84
    iget v5, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->cnt:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->cnt:I

    goto :goto_0

    .line 69
    :cond_3
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->set:[I

    aget v6, v6, v3

    if-ne p1, v6, :cond_4

    move v4, v5

    .line 70
    goto :goto_0

    .line 72
    :cond_4
    add-int/lit8 v1, v3, 0x1

    goto :goto_1
.end method
