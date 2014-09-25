.class Lorg/eclipse/jgit/revwalk/RewriteGenerator;
.super Lorg/eclipse/jgit/revwalk/Generator;
.source "RewriteGenerator.java"


# static fields
.field private static final DUPLICATE:I = 0x10

.field private static final REWRITE:I = 0x8


# instance fields
.field private final source:Lorg/eclipse/jgit/revwalk/Generator;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/Generator;)V
    .locals 0
    .parameter "s"

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/Generator;-><init>()V

    .line 80
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/RewriteGenerator;->source:Lorg/eclipse/jgit/revwalk/Generator;

    .line 81
    return-void
.end method

.method private cleanup([Lorg/eclipse/jgit/revwalk/RevCommit;)[Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 9
    .parameter "oldList"

    .prologue
    .line 158
    const/4 v3, 0x0

    .line 159
    .local v3, newCnt:I
    const/4 v6, 0x0

    .local v6, o:I
    :goto_0
    array-length v8, p1

    if-ge v6, v8, :cond_2

    .line 160
    aget-object v7, p1, v6

    .line 161
    .local v7, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v7, :cond_0

    .line 159
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 163
    :cond_0
    iget v8, v7, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v8, v8, 0x10

    if-eqz v8, :cond_1

    .line 164
    const/4 v8, 0x0

    aput-object v8, p1, v6

    goto :goto_1

    .line 167
    :cond_1
    iget v8, v7, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v8, v8, 0x10

    iput v8, v7, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 168
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 171
    .end local v7           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_2
    array-length v8, p1

    if-ne v3, v8, :cond_3

    .line 172
    move-object v0, p1

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_2
    if-ge v1, v2, :cond_5

    aget-object v7, v0, v1

    .line 173
    .restart local v7       #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget v8, v7, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v8, v8, -0x11

    iput v8, v7, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 172
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 177
    .end local v0           #arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v7           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_3
    new-array v5, v3, [Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 178
    .local v5, newList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    const/4 v3, 0x0

    .line 179
    move-object v0, p1

    .restart local v0       #arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v2, v0

    .restart local v2       #len$:I
    const/4 v1, 0x0

    .restart local v1       #i$:I
    move v4, v3

    .end local v3           #newCnt:I
    .local v4, newCnt:I
    :goto_3
    if-ge v1, v2, :cond_4

    aget-object v7, v0, v1

    .line 180
    .restart local v7       #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v7, :cond_6

    .line 181
    add-int/lit8 v3, v4, 0x1

    .end local v4           #newCnt:I
    .restart local v3       #newCnt:I
    aput-object v7, v5, v4

    .line 182
    iget v8, v7, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v8, v8, -0x11

    iput v8, v7, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 179
    :goto_4
    add-int/lit8 v1, v1, 0x1

    move v4, v3

    .end local v3           #newCnt:I
    .restart local v4       #newCnt:I
    goto :goto_3

    .end local v7           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_4
    move v3, v4

    .end local v4           #newCnt:I
    .restart local v3       #newCnt:I
    move-object p1, v5

    .line 186
    .end local v5           #newList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local p1
    :cond_5
    return-object p1

    .end local v3           #newCnt:I
    .restart local v4       #newCnt:I
    .restart local v5       #newList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v7       #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local p1
    :cond_6
    move v3, v4

    .end local v4           #newCnt:I
    .restart local v3       #newCnt:I
    goto :goto_4
.end method

.method private rewrite(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 3
    .parameter "p"

    .prologue
    .line 121
    :goto_0
    iget-object v0, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 122
    .local v0, pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v1, v0

    const/4 v2, 0x1

    if-le v1, v2, :cond_1

    .line 146
    .end local p1
    :cond_0
    :goto_1
    return-object p1

    .line 128
    .restart local p1
    :cond_1
    iget v1, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v1, v1, 0x4

    if-nez v1, :cond_0

    .line 135
    iget v1, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_0

    .line 142
    array-length v1, v0

    if-nez v1, :cond_2

    .line 146
    const/4 p1, 0x0

    goto :goto_1

    .line 149
    :cond_2
    const/4 v1, 0x0

    aget-object p1, v0, v1

    .line 150
    goto :goto_0
.end method


# virtual methods
.method next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/RewriteGenerator;->source:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v7}, Lorg/eclipse/jgit/revwalk/Generator;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 98
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_1

    .line 99
    const/4 v0, 0x0

    .line 115
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_0
    :goto_0
    return-object v0

    .line 101
    .restart local v0       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    const/4 v6, 0x0

    .line 102
    .local v6, rewrote:Z
    iget-object v5, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 103
    .local v5, pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v2, v5

    .line 104
    .local v2, nParents:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v2, :cond_3

    .line 105
    aget-object v4, v5, v1

    .line 106
    .local v4, oldp:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/revwalk/RewriteGenerator;->rewrite(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v3

    .line 107
    .local v3, newp:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eq v4, v3, :cond_2

    .line 108
    aput-object v3, v5, v1

    .line 109
    const/4 v6, 0x1

    .line 104
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 112
    .end local v3           #newp:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v4           #oldp:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_3
    if-eqz v6, :cond_0

    .line 113
    invoke-direct {p0, v5}, Lorg/eclipse/jgit/revwalk/RewriteGenerator;->cleanup([Lorg/eclipse/jgit/revwalk/RevCommit;)[Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v7

    iput-object v7, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    goto :goto_0
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RewriteGenerator;->source:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/Generator;->outputType()I

    move-result v0

    and-int/lit8 v0, v0, -0x5

    return v0
.end method

.method shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V
    .locals 1
    .parameter "q"

    .prologue
    .line 85
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RewriteGenerator;->source:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/Generator;->shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V

    .line 86
    return-void
.end method
