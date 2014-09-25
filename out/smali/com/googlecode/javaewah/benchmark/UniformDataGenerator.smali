.class public Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;
.super Ljava/lang/Object;
.source "UniformDataGenerator.java"


# instance fields
.field rand:Ljava/util/Random;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->rand:Ljava/util/Random;

    .line 24
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->rand:Ljava/util/Random;

    .line 25
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .parameter "seed"

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->rand:Ljava/util/Random;

    .line 31
    new-instance v0, Ljava/util/Random;

    int-to-long v1, p1

    invoke-direct {v0, v1, v2}, Ljava/util/Random;-><init>(J)V

    iput-object v0, p0, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->rand:Ljava/util/Random;

    .line 32
    return-void
.end method

.method static negate([II)[I
    .locals 8
    .parameter "x"
    .parameter "Max"

    .prologue
    .line 56
    array-length v7, p0

    sub-int v7, p1, v7

    new-array v0, v7, [I

    .line 57
    .local v0, ans:[I
    const/4 v3, 0x0

    .line 58
    .local v3, i:I
    const/4 v1, 0x0

    .line 59
    .local v1, c:I
    const/4 v5, 0x0

    .local v5, j:I
    :goto_0
    array-length v7, p0

    if-ge v5, v7, :cond_1

    .line 60
    aget v6, p0, v5

    .local v6, v:I
    move v2, v1

    .line 61
    .end local v1           #c:I
    .local v2, c:I
    :goto_1
    if-ge v3, v6, :cond_0

    .line 62
    add-int/lit8 v1, v2, 0x1

    .end local v2           #c:I
    .restart local v1       #c:I
    aput v3, v0, v2

    .line 61
    add-int/lit8 v3, v3, 0x1

    move v2, v1

    .end local v1           #c:I
    .restart local v2       #c:I
    goto :goto_1

    .line 63
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 59
    add-int/lit8 v5, v5, 0x1

    move v1, v2

    .end local v2           #c:I
    .restart local v1       #c:I
    goto :goto_0

    .line 65
    .end local v6           #v:I
    :cond_1
    :goto_2
    array-length v7, v0

    if-ge v1, v7, :cond_2

    .line 66
    add-int/lit8 v2, v1, 0x1

    .end local v1           #c:I
    .restart local v2       #c:I
    add-int/lit8 v4, v3, 0x1

    .end local v3           #i:I
    .local v4, i:I
    aput v3, v0, v1

    move v1, v2

    .end local v2           #c:I
    .restart local v1       #c:I
    move v3, v4

    .end local v4           #i:I
    .restart local v3       #i:I
    goto :goto_2

    .line 67
    :cond_2
    return-object v0
.end method


# virtual methods
.method public generateUniform(II)[I
    .locals 1
    .parameter "N"
    .parameter "Max"

    .prologue
    .line 78
    mul-int/lit8 v0, p1, 0x2

    if-le v0, p2, :cond_0

    .line 79
    sub-int v0, p2, p1

    invoke-virtual {p0, v0, p2}, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->generateUniform(II)[I

    move-result-object v0

    invoke-static {v0, p2}, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->negate([II)[I

    move-result-object v0

    .line 83
    :goto_0
    return-object v0

    .line 81
    :cond_0
    mul-int/lit16 v0, p1, 0x800

    if-le v0, p2, :cond_1

    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->generateUniformBitmap(II)[I

    move-result-object v0

    goto :goto_0

    .line 83
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->generateUniformHash(II)[I

    move-result-object v0

    goto :goto_0
.end method

.method generateUniformBitmap(II)[I
    .locals 9
    .parameter "N"
    .parameter "Max"

    .prologue
    .line 93
    if-le p1, p2, :cond_0

    .line 94
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "not possible"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 95
    :cond_0
    new-array v0, p1, [I

    .line 96
    .local v0, ans:[I
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, p2}, Ljava/util/BitSet;-><init>(I)V

    .line 97
    .local v1, bs:Ljava/util/BitSet;
    const/4 v2, 0x0

    .line 98
    .local v2, cardinality:I
    :cond_1
    :goto_0
    if-ge v2, p1, :cond_2

    .line 99
    iget-object v7, p0, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->rand:Ljava/util/Random;

    invoke-virtual {v7, p2}, Ljava/util/Random;->nextInt(I)I

    move-result v6

    .line 100
    .local v6, v:I
    invoke-virtual {v1, v6}, Ljava/util/BitSet;->get(I)Z

    move-result v7

    if-nez v7, :cond_1

    .line 101
    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 102
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 105
    .end local v6           #v:I
    :cond_2
    const/4 v4, 0x0

    .line 106
    .local v4, pos:I
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v3

    .local v3, i:I
    move v5, v4

    .end local v4           #pos:I
    .local v5, pos:I
    :goto_1
    if-ltz v3, :cond_3

    .line 107
    add-int/lit8 v4, v5, 0x1

    .end local v5           #pos:I
    .restart local v4       #pos:I
    aput v3, v0, v5

    .line 106
    add-int/lit8 v7, v3, 0x1

    invoke-virtual {v1, v7}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v3

    move v5, v4

    .end local v4           #pos:I
    .restart local v5       #pos:I
    goto :goto_1

    .line 109
    :cond_3
    return-object v0
.end method

.method generateUniformHash(II)[I
    .locals 6
    .parameter "N"
    .parameter "Max"

    .prologue
    .line 38
    if-le p1, p2, :cond_0

    .line 39
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "not possible"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 40
    :cond_0
    new-array v0, p1, [I

    .line 41
    .local v0, ans:[I
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 42
    .local v3, s:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Integer;>;"
    :goto_0
    invoke-virtual {v3}, Ljava/util/HashSet;->size()I

    move-result v4

    if-ge v4, p1, :cond_1

    .line 43
    new-instance v4, Ljava/lang/Integer;

    iget-object v5, p0, Lcom/googlecode/javaewah/benchmark/UniformDataGenerator;->rand:Ljava/util/Random;

    invoke-virtual {v5, p2}, Ljava/util/Random;->nextInt(I)I

    move-result v5

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 45
    .local v1, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .local v2, k:I
    :goto_1
    if-ge v2, p1, :cond_2

    .line 46
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aput v4, v0, v2

    .line 45
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 47
    :cond_2
    invoke-static {v0}, Ljava/util/Arrays;->sort([I)V

    .line 48
    return-object v0
.end method
