.class public Lorg/eclipse/jgit/util/IntList;
.super Ljava/lang/Object;
.source "IntList.java"


# instance fields
.field private count:I

.field private entries:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 55
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/util/IntList;-><init>(I)V

    .line 56
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "capacity"

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-array v0, p1, [I

    iput-object v0, p0, Lorg/eclipse/jgit/util/IntList;->entries:[I

    .line 66
    return-void
.end method

.method private grow()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 136
    iget-object v1, p0, Lorg/eclipse/jgit/util/IntList;->entries:[I

    array-length v1, v1

    add-int/lit8 v1, v1, 0x10

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    new-array v0, v1, [I

    .line 137
    .local v0, n:[I
    iget-object v1, p0, Lorg/eclipse/jgit/util/IntList;->entries:[I

    iget v2, p0, Lorg/eclipse/jgit/util/IntList;->count:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 138
    iput-object v0, p0, Lorg/eclipse/jgit/util/IntList;->entries:[I

    .line 139
    return-void
.end method


# virtual methods
.method public add(I)V
    .locals 3
    .parameter "n"

    .prologue
    .line 98
    iget v0, p0, Lorg/eclipse/jgit/util/IntList;->count:I

    iget-object v1, p0, Lorg/eclipse/jgit/util/IntList;->entries:[I

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 99
    invoke-direct {p0}, Lorg/eclipse/jgit/util/IntList;->grow()V

    .line 100
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/IntList;->entries:[I

    iget v1, p0, Lorg/eclipse/jgit/util/IntList;->count:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/util/IntList;->count:I

    aput p1, v0, v1

    .line 101
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 88
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/util/IntList;->count:I

    .line 89
    return-void
.end method

.method public fillTo(II)V
    .locals 1
    .parameter "toIndex"
    .parameter "val"

    .prologue
    .line 131
    :goto_0
    iget v0, p0, Lorg/eclipse/jgit/util/IntList;->count:I

    if-ge v0, p1, :cond_0

    .line 132
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/util/IntList;->add(I)V

    goto :goto_0

    .line 133
    :cond_0
    return-void
.end method

.method public get(I)I
    .locals 1
    .parameter "i"

    .prologue
    .line 81
    iget v0, p0, Lorg/eclipse/jgit/util/IntList;->count:I

    if-gt v0, p1, :cond_0

    .line 82
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 83
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/IntList;->entries:[I

    aget v0, v0, p1

    return v0
.end method

.method public set(II)V
    .locals 1
    .parameter "index"
    .parameter "n"

    .prologue
    .line 112
    iget v0, p0, Lorg/eclipse/jgit/util/IntList;->count:I

    if-ge v0, p1, :cond_0

    .line 113
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 114
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/util/IntList;->count:I

    if-ne v0, p1, :cond_1

    .line 115
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/util/IntList;->add(I)V

    .line 118
    :goto_0
    return-void

    .line 117
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/util/IntList;->entries:[I

    aput p2, v0, p1

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 70
    iget v0, p0, Lorg/eclipse/jgit/util/IntList;->count:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 142
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 143
    .local v1, r:Ljava/lang/StringBuilder;
    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 144
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v2, p0, Lorg/eclipse/jgit/util/IntList;->count:I

    if-ge v0, v2, :cond_1

    .line 145
    if-lez v0, :cond_0

    .line 146
    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/util/IntList;->entries:[I

    aget v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 149
    :cond_1
    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 150
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
