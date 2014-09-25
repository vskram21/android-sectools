.class final Lorg/eclipse/jgit/transport/LongMap;
.super Ljava/lang/Object;
.source "LongMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/LongMap$Node;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final LOAD_FACTOR:F = 0.75f


# instance fields
.field private growAt:I

.field private size:I

.field private table:[Lorg/eclipse/jgit/transport/LongMap$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/eclipse/jgit/transport/LongMap$Node",
            "<TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 63
    .local p0, this:Lorg/eclipse/jgit/transport/LongMap;,"Lorg/eclipse/jgit/transport/LongMap<TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const/16 v0, 0x40

    invoke-static {v0}, Lorg/eclipse/jgit/transport/LongMap;->createArray(I)[Lorg/eclipse/jgit/transport/LongMap$Node;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    .line 65
    iget-object v0, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    array-length v0, v0

    int-to-float v0, v0

    const/high16 v1, 0x3f40

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lorg/eclipse/jgit/transport/LongMap;->growAt:I

    .line 66
    return-void
.end method

.method private static final createArray(I)[Lorg/eclipse/jgit/transport/LongMap$Node;
    .locals 1
    .parameter "sz"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(I)[",
            "Lorg/eclipse/jgit/transport/LongMap$Node",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 143
    new-array v0, p0, [Lorg/eclipse/jgit/transport/LongMap$Node;

    return-object v0
.end method

.method private grow()V
    .locals 7

    .prologue
    .line 120
    .local p0, this:Lorg/eclipse/jgit/transport/LongMap;,"Lorg/eclipse/jgit/transport/LongMap<TV;>;"
    iget-object v4, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    .line 121
    .local v4, oldTable:[Lorg/eclipse/jgit/transport/LongMap$Node;,"[Lorg/eclipse/jgit/transport/LongMap$Node<TV;>;"
    iget-object v5, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    array-length v3, v5

    .line 123
    .local v3, oldSize:I
    shl-int/lit8 v5, v3, 0x1

    invoke-static {v5}, Lorg/eclipse/jgit/transport/LongMap;->createArray(I)[Lorg/eclipse/jgit/transport/LongMap$Node;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    .line 124
    iget-object v5, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    array-length v5, v5

    int-to-float v5, v5

    const/high16 v6, 0x3f40

    mul-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, p0, Lorg/eclipse/jgit/transport/LongMap;->growAt:I

    .line 125
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v3, :cond_1

    .line 126
    aget-object v0, v4, v1

    .line 127
    .local v0, e:Lorg/eclipse/jgit/transport/LongMap$Node;,"Lorg/eclipse/jgit/transport/LongMap$Node<TV;>;"
    :goto_1
    if-eqz v0, :cond_0

    .line 128
    iget-object v2, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->next:Lorg/eclipse/jgit/transport/LongMap$Node;

    .line 129
    .local v2, n:Lorg/eclipse/jgit/transport/LongMap$Node;,"Lorg/eclipse/jgit/transport/LongMap$Node<TV;>;"
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/LongMap;->insert(Lorg/eclipse/jgit/transport/LongMap$Node;)V

    .line 130
    move-object v0, v2

    .line 131
    goto :goto_1

    .line 125
    .end local v2           #n:Lorg/eclipse/jgit/transport/LongMap$Node;,"Lorg/eclipse/jgit/transport/LongMap$Node<TV;>;"
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 133
    .end local v0           #e:Lorg/eclipse/jgit/transport/LongMap$Node;,"Lorg/eclipse/jgit/transport/LongMap$Node<TV;>;"
    :cond_1
    return-void
.end method

.method private final index(J)I
    .locals 3
    .parameter "key"

    .prologue
    .line 136
    .local p0, this:Lorg/eclipse/jgit/transport/LongMap;,"Lorg/eclipse/jgit/transport/LongMap<TV;>;"
    long-to-int v1, p1

    ushr-int/lit8 v0, v1, 0x1

    .line 137
    .local v0, h:I
    ushr-int/lit8 v1, v0, 0x14

    ushr-int/lit8 v2, v0, 0xc

    xor-int/2addr v1, v2

    xor-int/2addr v0, v1

    .line 138
    iget-object v1, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v1, v0

    return v1
.end method

.method private insert(Lorg/eclipse/jgit/transport/LongMap$Node;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/LongMap$Node",
            "<TV;>;)V"
        }
    .end annotation

    .prologue
    .line 114
    .local p0, this:Lorg/eclipse/jgit/transport/LongMap;,"Lorg/eclipse/jgit/transport/LongMap<TV;>;"
    .local p1, n:Lorg/eclipse/jgit/transport/LongMap$Node;,"Lorg/eclipse/jgit/transport/LongMap$Node<TV;>;"
    iget-wide v1, p1, Lorg/eclipse/jgit/transport/LongMap$Node;->key:J

    invoke-direct {p0, v1, v2}, Lorg/eclipse/jgit/transport/LongMap;->index(J)I

    move-result v0

    .line 115
    .local v0, idx:I
    iget-object v1, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    aget-object v1, v1, v0

    iput-object v1, p1, Lorg/eclipse/jgit/transport/LongMap$Node;->next:Lorg/eclipse/jgit/transport/LongMap$Node;

    .line 116
    iget-object v1, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    aput-object p1, v1, v0

    .line 117
    return-void
.end method


# virtual methods
.method containsKey(J)Z
    .locals 1
    .parameter "key"

    .prologue
    .line 69
    .local p0, this:Lorg/eclipse/jgit/transport/LongMap;,"Lorg/eclipse/jgit/transport/LongMap<TV;>;"
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/transport/LongMap;->get(J)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method get(J)Ljava/lang/Object;
    .locals 3
    .parameter "key"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TV;"
        }
    .end annotation

    .prologue
    .line 73
    .local p0, this:Lorg/eclipse/jgit/transport/LongMap;,"Lorg/eclipse/jgit/transport/LongMap<TV;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/LongMap;->index(J)I

    move-result v2

    aget-object v0, v1, v2

    .local v0, n:Lorg/eclipse/jgit/transport/LongMap$Node;,"Lorg/eclipse/jgit/transport/LongMap$Node<TV;>;"
    :goto_0
    if-eqz v0, :cond_1

    .line 74
    iget-wide v1, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->key:J

    cmp-long v1, v1, p1

    if-nez v1, :cond_0

    .line 75
    iget-object v1, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->value:Ljava/lang/Object;

    .line 77
    :goto_1
    return-object v1

    .line 73
    :cond_0
    iget-object v0, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->next:Lorg/eclipse/jgit/transport/LongMap$Node;

    goto :goto_0

    .line 77
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method put(JLjava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .parameter "key"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTV;)TV;"
        }
    .end annotation

    .prologue
    .line 99
    .local p0, this:Lorg/eclipse/jgit/transport/LongMap;,"Lorg/eclipse/jgit/transport/LongMap<TV;>;"
    .local p3, value:Ljava/lang/Object;,"TV;"
    iget-object v2, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/LongMap;->index(J)I

    move-result v3

    aget-object v0, v2, v3

    .local v0, n:Lorg/eclipse/jgit/transport/LongMap$Node;,"Lorg/eclipse/jgit/transport/LongMap$Node<TV;>;"
    :goto_0
    if-eqz v0, :cond_1

    .line 100
    iget-wide v2, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->key:J

    cmp-long v2, v2, p1

    if-nez v2, :cond_0

    .line 101
    iget-object v1, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->value:Ljava/lang/Object;

    .line 102
    .local v1, o:Ljava/lang/Object;,"TV;"
    iput-object p3, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->value:Ljava/lang/Object;

    .line 110
    .end local v1           #o:Ljava/lang/Object;,"TV;"
    :goto_1
    return-object v1

    .line 99
    :cond_0
    iget-object v0, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->next:Lorg/eclipse/jgit/transport/LongMap$Node;

    goto :goto_0

    .line 107
    :cond_1
    iget v2, p0, Lorg/eclipse/jgit/transport/LongMap;->size:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/eclipse/jgit/transport/LongMap;->size:I

    iget v3, p0, Lorg/eclipse/jgit/transport/LongMap;->growAt:I

    if-ne v2, v3, :cond_2

    .line 108
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/LongMap;->grow()V

    .line 109
    :cond_2
    new-instance v2, Lorg/eclipse/jgit/transport/LongMap$Node;

    invoke-direct {v2, p1, p2, p3}, Lorg/eclipse/jgit/transport/LongMap$Node;-><init>(JLjava/lang/Object;)V

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/LongMap;->insert(Lorg/eclipse/jgit/transport/LongMap$Node;)V

    .line 110
    const/4 v1, 0x0

    goto :goto_1
.end method

.method remove(J)Ljava/lang/Object;
    .locals 5
    .parameter "key"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TV;"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, this:Lorg/eclipse/jgit/transport/LongMap;,"Lorg/eclipse/jgit/transport/LongMap<TV;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/LongMap;->index(J)I

    move-result v3

    aget-object v0, v2, v3

    .line 82
    .local v0, n:Lorg/eclipse/jgit/transport/LongMap$Node;,"Lorg/eclipse/jgit/transport/LongMap$Node<TV;>;"
    const/4 v1, 0x0

    .line 83
    .local v1, prior:Lorg/eclipse/jgit/transport/LongMap$Node;,"Lorg/eclipse/jgit/transport/LongMap$Node<TV;>;"
    :goto_0
    if-eqz v0, :cond_2

    .line 84
    iget-wide v2, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->key:J

    cmp-long v2, v2, p1

    if-nez v2, :cond_1

    .line 85
    if-nez v1, :cond_0

    .line 86
    iget-object v2, p0, Lorg/eclipse/jgit/transport/LongMap;->table:[Lorg/eclipse/jgit/transport/LongMap$Node;

    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/LongMap;->index(J)I

    move-result v3

    iget-object v4, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->next:Lorg/eclipse/jgit/transport/LongMap$Node;

    aput-object v4, v2, v3

    .line 89
    :goto_1
    iget v2, p0, Lorg/eclipse/jgit/transport/LongMap;->size:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/eclipse/jgit/transport/LongMap;->size:I

    .line 90
    iget-object v2, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->value:Ljava/lang/Object;

    .line 95
    :goto_2
    return-object v2

    .line 88
    :cond_0
    iget-object v2, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->next:Lorg/eclipse/jgit/transport/LongMap$Node;

    iput-object v2, v1, Lorg/eclipse/jgit/transport/LongMap$Node;->next:Lorg/eclipse/jgit/transport/LongMap$Node;

    goto :goto_1

    .line 92
    :cond_1
    move-object v1, v0

    .line 93
    iget-object v0, v0, Lorg/eclipse/jgit/transport/LongMap$Node;->next:Lorg/eclipse/jgit/transport/LongMap$Node;

    goto :goto_0

    .line 95
    :cond_2
    const/4 v2, 0x0

    goto :goto_2
.end method
