.class public Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;
.super Lorg/eclipse/jgit/lib/ObjectStream;
.source "ObjectStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/ObjectStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SmallStream"
.end annotation


# instance fields
.field private final data:[B

.field private mark:I

.field private ptr:I

.field private final type:I


# direct methods
.method public constructor <init>(I[B)V
    .locals 0
    .parameter "type"
    .parameter "data"

    .prologue
    .line 91
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectStream;-><init>()V

    .line 92
    iput p1, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->type:I

    .line 93
    iput-object p2, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->data:[B

    .line 94
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectLoader;)V
    .locals 2
    .parameter "loader"

    .prologue
    .line 80
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getType()I

    move-result v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;-><init>(I[B)V

    .line 81
    return-void
.end method


# virtual methods
.method public available()I
    .locals 2

    .prologue
    .line 108
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->data:[B

    array-length v0, v0

    iget v1, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->ptr:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 103
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->data:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->type:I

    return v0
.end method

.method public mark(I)V
    .locals 1
    .parameter "readlimit"

    .prologue
    .line 142
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->ptr:I

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->mark:I

    .line 143
    return-void
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 137
    const/4 v0, 0x1

    return v0
.end method

.method public read()I
    .locals 3

    .prologue
    .line 120
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->ptr:I

    iget-object v1, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->data:[B

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 121
    const/4 v0, -0x1

    .line 122
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->data:[B

    iget v1, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->ptr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->ptr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    goto :goto_0
.end method

.method public read([BII)I
    .locals 3
    .parameter "b"
    .parameter "off"
    .parameter "len"

    .prologue
    .line 127
    iget v1, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->ptr:I

    iget-object v2, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->data:[B

    array-length v2, v2

    if-ne v1, v2, :cond_0

    .line 128
    const/4 v0, -0x1

    .line 132
    :goto_0
    return v0

    .line 129
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->available()I

    move-result v1

    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 130
    .local v0, n:I
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->data:[B

    iget v2, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->ptr:I

    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 131
    iget v1, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->ptr:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->ptr:I

    goto :goto_0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 147
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->mark:I

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->ptr:I

    .line 148
    return-void
.end method

.method public skip(J)J
    .locals 5
    .parameter "n"

    .prologue
    .line 113
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->available()I

    move-result v1

    int-to-long v1, v1

    const-wide/16 v3, 0x0

    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v0, v1

    .line 114
    .local v0, s:I
    iget v1, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->ptr:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;->ptr:I

    .line 115
    int-to-long v1, v0

    return-wide v1
.end method
