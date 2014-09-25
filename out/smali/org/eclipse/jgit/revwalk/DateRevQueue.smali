.class public Lorg/eclipse/jgit/revwalk/DateRevQueue;
.super Lorg/eclipse/jgit/revwalk/AbstractRevQueue;
.source "DateRevQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    }
.end annotation


# static fields
.field private static final REBUILD_INDEX_COUNT:I = 0x3e8


# instance fields
.field private first:I

.field private free:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

.field private head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

.field private inQueue:I

.field private index:[Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

.field private last:I

.field private sinceLastIndex:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;-><init>()V

    .line 68
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->last:I

    .line 73
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/revwalk/Generator;)V
    .locals 2
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;-><init>()V

    .line 68
    const/4 v1, -0x1

    iput v1, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->last:I

    .line 78
    :goto_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/Generator;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 79
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_0

    .line 83
    return-void

    .line 81
    :cond_0
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_0
.end method

.method private buildIndex()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 144
    iput v4, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->sinceLastIndex:I

    .line 145
    iput v4, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->first:I

    .line 146
    iget v4, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->inQueue:I

    div-int/lit8 v4, v4, 0x64

    add-int/lit8 v4, v4, 0x1

    new-array v4, v4, [Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    iput-object v4, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->index:[Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 147
    const/4 v3, 0x0

    .local v3, qi:I
    const/4 v0, 0x0

    .line 148
    .local v0, ii:I
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .local v2, q:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    move v1, v0

    .end local v0           #ii:I
    .local v1, ii:I
    :goto_0
    if-eqz v2, :cond_0

    .line 149
    add-int/lit8 v3, v3, 0x1

    rem-int/lit8 v4, v3, 0x64

    if-nez v4, :cond_1

    .line 150
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->index:[Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    add-int/lit8 v0, v1, 0x1

    .end local v1           #ii:I
    .restart local v0       #ii:I
    aput-object v2, v4, v1

    .line 148
    :goto_1
    iget-object v2, v2, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    move v1, v0

    .end local v0           #ii:I
    .restart local v1       #ii:I
    goto :goto_0

    .line 152
    :cond_0
    add-int/lit8 v4, v1, -0x1

    iput v4, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->last:I

    .line 153
    return-void

    :cond_1
    move v0, v1

    .end local v1           #ii:I
    .restart local v0       #ii:I
    goto :goto_1
.end method

.method private freeEntry(Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;)V
    .locals 1
    .parameter "e"

    .prologue
    .line 212
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->free:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    iput-object v0, p1, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 213
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->free:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 214
    return-void
.end method

.method private newEntry(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    .locals 2
    .parameter "c"

    .prologue
    .line 202
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->free:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 203
    .local v0, r:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    if-nez v0, :cond_0

    .line 204
    new-instance v0, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .end local v0           #r:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;-><init>()V

    .line 207
    .restart local v0       #r:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    :goto_0
    iput-object p1, v0, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->commit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 208
    return-object v0

    .line 206
    :cond_0
    iget-object v1, v0, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->free:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    goto :goto_0
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 11
    .parameter "c"

    .prologue
    const/16 v10, 0x3e8

    .line 86
    iget v9, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->sinceLastIndex:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->sinceLastIndex:I

    .line 87
    iget v9, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->inQueue:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->inQueue:I

    if-le v9, v10, :cond_0

    iget v9, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->sinceLastIndex:I

    if-le v9, v10, :cond_0

    .line 89
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->buildIndex()V

    .line 91
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 92
    .local v5, q:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    iget v9, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->commitTime:I

    int-to-long v7, v9

    .line 94
    .local v7, when:J
    iget v9, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->first:I

    iget v10, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->last:I

    if-gt v9, v10, :cond_5

    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->index:[Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    iget v10, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->first:I

    aget-object v9, v9, v10

    iget-object v9, v9, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->commit:Lorg/eclipse/jgit/revwalk/RevCommit;

    iget v9, v9, Lorg/eclipse/jgit/revwalk/RevCommit;->commitTime:I

    int-to-long v9, v9

    cmp-long v9, v9, v7

    if-lez v9, :cond_5

    .line 95
    iget v1, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->first:I

    .local v1, low:I
    iget v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->last:I

    .line 96
    .local v0, high:I
    :goto_0
    if-gt v1, v0, :cond_3

    .line 97
    add-int v9, v1, v0

    ushr-int/lit8 v2, v9, 0x1

    .line 98
    .local v2, mid:I
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->index:[Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    aget-object v9, v9, v2

    iget-object v9, v9, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->commit:Lorg/eclipse/jgit/revwalk/RevCommit;

    iget v6, v9, Lorg/eclipse/jgit/revwalk/RevCommit;->commitTime:I

    .line 99
    .local v6, t:I
    int-to-long v9, v6

    cmp-long v9, v9, v7

    if-gez v9, :cond_1

    .line 100
    add-int/lit8 v0, v2, -0x1

    goto :goto_0

    .line 101
    :cond_1
    int-to-long v9, v6

    cmp-long v9, v9, v7

    if-lez v9, :cond_2

    .line 102
    add-int/lit8 v1, v2, 0x1

    goto :goto_0

    .line 104
    :cond_2
    add-int/lit8 v1, v2, -0x1

    .line 108
    .end local v2           #mid:I
    .end local v6           #t:I
    :cond_3
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 109
    :goto_1
    iget v9, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->first:I

    if-le v1, v9, :cond_4

    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->index:[Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    aget-object v9, v9, v1

    iget-object v9, v9, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->commit:Lorg/eclipse/jgit/revwalk/RevCommit;

    iget v9, v9, Lorg/eclipse/jgit/revwalk/RevCommit;->commitTime:I

    int-to-long v9, v9

    cmp-long v9, v7, v9

    if-nez v9, :cond_4

    .line 110
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 111
    :cond_4
    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->index:[Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    aget-object v5, v9, v1

    .line 114
    .end local v0           #high:I
    .end local v1           #low:I
    :cond_5
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->newEntry(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    move-result-object v3

    .line 115
    .local v3, n:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    if-eqz v5, :cond_6

    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    if-ne v5, v9, :cond_7

    iget-object v9, v5, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->commit:Lorg/eclipse/jgit/revwalk/RevCommit;

    iget v9, v9, Lorg/eclipse/jgit/revwalk/RevCommit;->commitTime:I

    int-to-long v9, v9

    cmp-long v9, v7, v9

    if-lez v9, :cond_7

    .line 116
    :cond_6
    iput-object v5, v3, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 117
    iput-object v3, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 127
    :goto_2
    return-void

    .line 119
    :cond_7
    iget-object v4, v5, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 120
    .local v4, p:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    :goto_3
    if-eqz v4, :cond_8

    iget-object v9, v4, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->commit:Lorg/eclipse/jgit/revwalk/RevCommit;

    iget v9, v9, Lorg/eclipse/jgit/revwalk/RevCommit;->commitTime:I

    int-to-long v9, v9

    cmp-long v9, v9, v7

    if-lez v9, :cond_8

    .line 121
    move-object v5, v4

    .line 122
    iget-object v4, v5, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    goto :goto_3

    .line 124
    :cond_8
    iget-object v9, v5, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    iput-object v9, v3, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 125
    iput-object v3, v5, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    goto :goto_2
.end method

.method anybodyHasFlag(I)Z
    .locals 2
    .parameter "f"

    .prologue
    .line 182
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .local v0, q:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    :goto_0
    if-eqz v0, :cond_1

    .line 183
    iget-object v1, v0, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->commit:Lorg/eclipse/jgit/revwalk/RevCommit;

    iget v1, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v1, p1

    if-eqz v1, :cond_0

    .line 184
    const/4 v1, 0x1

    .line 186
    :goto_1
    return v1

    .line 182
    :cond_0
    iget-object v0, v0, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    goto :goto_0

    .line 186
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public clear()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 165
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 166
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->free:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 167
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->index:[Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 168
    iput v1, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->inQueue:I

    .line 169
    iput v1, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->sinceLastIndex:I

    .line 170
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->last:I

    .line 171
    return-void
.end method

.method everbodyHasFlag(I)Z
    .locals 2
    .parameter "f"

    .prologue
    .line 174
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .local v0, q:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    :goto_0
    if-eqz v0, :cond_1

    .line 175
    iget-object v1, v0, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->commit:Lorg/eclipse/jgit/revwalk/RevCommit;

    iget v1, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v1, p1

    if-nez v1, :cond_0

    .line 176
    const/4 v1, 0x0

    .line 178
    :goto_1
    return v1

    .line 174
    :cond_0
    iget-object v0, v0, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    goto :goto_0

    .line 178
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 130
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 131
    .local v0, q:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    if-nez v0, :cond_0

    .line 140
    :goto_0
    return-object v1

    .line 134
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->index:[Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->index:[Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    iget v3, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->first:I

    aget-object v2, v2, v3

    if-ne v0, v2, :cond_1

    .line 135
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->index:[Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    iget v3, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->first:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->first:I

    aput-object v1, v2, v3

    .line 136
    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->inQueue:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->inQueue:I

    .line 138
    iget-object v1, v0, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .line 139
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->freeEntry(Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;)V

    .line 140
    iget-object v1, v0, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->commit:Lorg/eclipse/jgit/revwalk/RevCommit;

    goto :goto_0
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 191
    iget v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->outputType:I

    or-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public peek()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    iget-object v0, v0, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->commit:Lorg/eclipse/jgit/revwalk/RevCommit;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 195
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    .local v1, s:Ljava/lang/StringBuilder;
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DateRevQueue;->head:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    .local v0, q:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;
    :goto_0
    if-eqz v0, :cond_0

    .line 197
    iget-object v2, v0, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->commit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-static {v1, v2}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->describe(Ljava/lang/StringBuilder;Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 196
    iget-object v0, v0, Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;->next:Lorg/eclipse/jgit/revwalk/DateRevQueue$Entry;

    goto :goto_0

    .line 198
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
