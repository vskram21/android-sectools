.class public Lorg/eclipse/jgit/util/LongList;
.super Ljava/lang/Object;
.source "LongList.java"


# instance fields
.field private count:I

.field private entries:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 57
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/util/LongList;-><init>(I)V

    .line 58
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "capacity"

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    new-array v0, p1, [J

    iput-object v0, p0, Lorg/eclipse/jgit/util/LongList;->entries:[J

    .line 68
    return-void
.end method

.method private grow()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 157
    iget-object v1, p0, Lorg/eclipse/jgit/util/LongList;->entries:[J

    array-length v1, v1

    add-int/lit8 v1, v1, 0x10

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    new-array v0, v1, [J

    .line 158
    .local v0, n:[J
    iget-object v1, p0, Lorg/eclipse/jgit/util/LongList;->entries:[J

    iget v2, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 159
    iput-object v0, p0, Lorg/eclipse/jgit/util/LongList;->entries:[J

    .line 160
    return-void
.end method


# virtual methods
.method public add(J)V
    .locals 3
    .parameter "n"

    .prologue
    .line 114
    iget v0, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    iget-object v1, p0, Lorg/eclipse/jgit/util/LongList;->entries:[J

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 115
    invoke-direct {p0}, Lorg/eclipse/jgit/util/LongList;->grow()V

    .line 116
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/LongList;->entries:[J

    iget v1, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    aput-wide p1, v0, v1

    .line 117
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 104
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    .line 105
    return-void
.end method

.method public contains(J)Z
    .locals 3
    .parameter "value"

    .prologue
    .line 96
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    if-ge v0, v1, :cond_1

    .line 97
    iget-object v1, p0, Lorg/eclipse/jgit/util/LongList;->entries:[J

    aget-wide v1, v1, v0

    cmp-long v1, v1, p1

    if-nez v1, :cond_0

    .line 98
    const/4 v1, 0x1

    .line 99
    :goto_1
    return v1

    .line 96
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 99
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public fillTo(IJ)V
    .locals 1
    .parameter "toIndex"
    .parameter "val"

    .prologue
    .line 147
    :goto_0
    iget v0, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    if-ge v0, p1, :cond_0

    .line 148
    invoke-virtual {p0, p2, p3}, Lorg/eclipse/jgit/util/LongList;->add(J)V

    goto :goto_0

    .line 149
    :cond_0
    return-void
.end method

.method public get(I)J
    .locals 2
    .parameter "i"

    .prologue
    .line 83
    iget v0, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    if-gt v0, p1, :cond_0

    .line 84
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 85
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/LongList;->entries:[J

    aget-wide v0, v0, p1

    return-wide v0
.end method

.method public set(IJ)V
    .locals 1
    .parameter "index"
    .parameter "n"

    .prologue
    .line 128
    iget v0, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    if-ge v0, p1, :cond_0

    .line 129
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 130
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    if-ne v0, p1, :cond_1

    .line 131
    invoke-virtual {p0, p2, p3}, Lorg/eclipse/jgit/util/LongList;->add(J)V

    .line 134
    :goto_0
    return-void

    .line 133
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/util/LongList;->entries:[J

    aput-wide p2, v0, p1

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    return v0
.end method

.method public sort()V
    .locals 3

    .prologue
    .line 153
    iget-object v0, p0, Lorg/eclipse/jgit/util/LongList;->entries:[J

    const/4 v1, 0x0

    iget v2, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->sort([JII)V

    .line 154
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 163
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 164
    .local v1, r:Ljava/lang/StringBuilder;
    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 165
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v2, p0, Lorg/eclipse/jgit/util/LongList;->count:I

    if-ge v0, v2, :cond_1

    .line 166
    if-lez v0, :cond_0

    .line 167
    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/util/LongList;->entries:[J

    aget-wide v2, v2, v0

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 165
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 170
    :cond_1
    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 171
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
