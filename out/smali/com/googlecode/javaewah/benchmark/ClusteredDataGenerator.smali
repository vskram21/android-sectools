.class public Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;
.super Ljava/lang/Object;
.source "ClusteredDataGenerator.java"


# instance fields
.field unidg:Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;

    invoke-direct {v0}, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->unidg:Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;

    .line 24
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "seed"

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;

    invoke-direct {v0, p1}, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;-><init>(I)V

    iput-object v0, p0, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->unidg:Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;

    .line 31
    return-void
.end method


# virtual methods
.method fillClustered([IIIII)V
    .locals 10
    .parameter "array"
    .parameter "offset"
    .parameter "length"
    .parameter "Min"
    .parameter "Max"

    .prologue
    .line 46
    sub-int v9, p5, p4

    .line 47
    .local v9, range:I
    if-eq v9, p3, :cond_0

    const/16 v0, 0xa

    if-gt p3, v0, :cond_1

    .line 48
    :cond_0
    invoke-virtual/range {p0 .. p5}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->fillUniform([IIIII)V

    .line 67
    :goto_0
    return-void

    .line 51
    :cond_1
    div-int/lit8 v1, p3, 0x2

    sub-int v0, v9, p3

    add-int/lit8 v0, v0, -0x1

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->unidg:Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;

    iget-object v0, v0, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->rand:Ljava/util/Random;

    sub-int v2, v9, p3

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    :goto_1
    add-int v6, v1, v0

    .line 53
    .local v6, cut:I
    iget-object v0, p0, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->unidg:Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;

    iget-object v0, v0, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->rand:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextDouble()D

    move-result-wide v7

    .line 54
    .local v7, p:D
    const-wide/high16 v0, 0x3fd0

    cmpg-double v0, v7, v0

    if-gez v0, :cond_3

    .line 55
    div-int/lit8 v3, p3, 0x2

    add-int v5, p4, v6

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->fillUniform([IIIII)V

    .line 56
    div-int/lit8 v0, p3, 0x2

    add-int v2, p2, v0

    div-int/lit8 v0, p3, 0x2

    sub-int v3, p3, v0

    add-int v4, p4, v6

    move-object v0, p0

    move-object v1, p1

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->fillClustered([IIIII)V

    goto :goto_0

    .line 51
    .end local v6           #cut:I
    .end local v7           #p:D
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 58
    .restart local v6       #cut:I
    .restart local v7       #p:D
    :cond_3
    const-wide/high16 v0, 0x3fe0

    cmpg-double v0, v7, v0

    if-gez v0, :cond_4

    .line 59
    div-int/lit8 v3, p3, 0x2

    add-int v5, p4, v6

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->fillClustered([IIIII)V

    .line 60
    div-int/lit8 v0, p3, 0x2

    add-int v2, p2, v0

    div-int/lit8 v0, p3, 0x2

    sub-int v3, p3, v0

    add-int v4, p4, v6

    move-object v0, p0

    move-object v1, p1

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->fillUniform([IIIII)V

    goto :goto_0

    .line 63
    :cond_4
    div-int/lit8 v3, p3, 0x2

    add-int v5, p4, v6

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->fillClustered([IIIII)V

    .line 64
    div-int/lit8 v0, p3, 0x2

    add-int v2, p2, v0

    div-int/lit8 v0, p3, 0x2

    sub-int v3, p3, v0

    add-int v4, p4, v6

    move-object v0, p0

    move-object v1, p1

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->fillClustered([IIIII)V

    goto :goto_0
.end method

.method fillUniform([IIIII)V
    .locals 4
    .parameter "array"
    .parameter "offset"
    .parameter "length"
    .parameter "Min"
    .parameter "Max"

    .prologue
    .line 70
    iget-object v2, p0, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->unidg:Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;

    sub-int v3, p5, p4

    invoke-virtual {v2, p3, v3}, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->generateUniform(II)[I

    move-result-object v1

    .line 71
    .local v1, v:[I
    const/4 v0, 0x0

    .local v0, k:I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 72
    add-int v2, v0, p2

    aget v3, v1, v0

    add-int/2addr v3, p4

    aput v3, p1, v2

    .line 71
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 73
    :cond_0
    return-void
.end method

.method public generateClustered(II)[I
    .locals 6
    .parameter "N"
    .parameter "Max"

    .prologue
    const/4 v2, 0x0

    .line 40
    new-array v1, p1, [I

    .local v1, array:[I
    move-object v0, p0

    move v3, p1

    move v4, v2

    move v5, p2

    .line 41
    invoke-virtual/range {v0 .. v5}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->fillClustered([IIIII)V

    .line 42
    return-object v1
.end method
