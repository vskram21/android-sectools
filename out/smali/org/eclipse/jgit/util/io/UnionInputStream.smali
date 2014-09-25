.class public Lorg/eclipse/jgit/util/io/UnionInputStream;
.super Ljava/io/InputStream;
.source "UnionInputStream.java"


# static fields
.field private static final EOF:Ljava/io/InputStream;


# instance fields
.field private final streams:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    new-instance v0, Lorg/eclipse/jgit/util/io/UnionInputStream$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/io/UnionInputStream$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/util/io/UnionInputStream;->EOF:Ljava/io/InputStream;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 70
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/UnionInputStream;->streams:Ljava/util/LinkedList;

    .line 75
    return-void
.end method

.method public varargs constructor <init>([Ljava/io/InputStream;)V
    .locals 5
    .parameter "inputStreams"

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 70
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    iput-object v4, p0, Lorg/eclipse/jgit/util/io/UnionInputStream;->streams:Ljava/util/LinkedList;

    .line 87
    move-object v0, p1

    .local v0, arr$:[Ljava/io/InputStream;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 88
    .local v1, i:Ljava/io/InputStream;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/util/io/UnionInputStream;->add(Ljava/io/InputStream;)V

    .line 87
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 89
    .end local v1           #i:Ljava/io/InputStream;
    :cond_0
    return-void
.end method

.method private head()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/UnionInputStream;->streams:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lorg/eclipse/jgit/util/io/UnionInputStream;->EOF:Ljava/io/InputStream;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/UnionInputStream;->streams:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/InputStream;

    goto :goto_0
.end method

.method private pop()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/UnionInputStream;->streams:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 97
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/UnionInputStream;->streams:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 98
    :cond_0
    return-void
.end method


# virtual methods
.method public add(Ljava/io/InputStream;)V
    .locals 1
    .parameter "in"

    .prologue
    .line 109
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/UnionInputStream;->streams:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 110
    return-void
.end method

.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/UnionInputStream;->head()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    const/4 v1, 0x0

    .line 197
    .local v1, err:Ljava/io/IOException;
    iget-object v3, p0, Lorg/eclipse/jgit/util/io/UnionInputStream;->streams:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/io/InputStream;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 199
    :try_start_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 200
    :catch_0
    move-exception v0

    .line 201
    .local v0, closeError:Ljava/io/IOException;
    move-object v1, v0

    goto :goto_1

    .line 206
    .end local v0           #closeError:Ljava/io/IOException;
    :cond_0
    if-eqz v1, :cond_1

    .line 207
    throw v1

    .line 208
    :cond_1
    return-void
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/UnionInputStream;->streams:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    :goto_0
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/UnionInputStream;->head()Ljava/io/InputStream;

    move-result-object v0

    .line 129
    .local v0, in:Ljava/io/InputStream;
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 130
    .local v1, r:I
    if-ltz v1, :cond_0

    .line 133
    .end local v1           #r:I
    :goto_1
    return v1

    .line 132
    .restart local v1       #r:I
    :cond_0
    sget-object v2, Lorg/eclipse/jgit/util/io/UnionInputStream;->EOF:Ljava/io/InputStream;

    if-ne v0, v2, :cond_1

    .line 133
    const/4 v1, -0x1

    goto :goto_1

    .line 135
    :cond_1
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/UnionInputStream;->pop()V

    goto :goto_0
.end method

.method public read([BII)I
    .locals 3
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    if-nez p3, :cond_2

    .line 142
    const/4 v1, 0x0

    .line 149
    :cond_0
    :goto_0
    return v1

    .line 151
    .local v0, in:Ljava/io/InputStream;
    .local v1, n:I
    :cond_1
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/UnionInputStream;->pop()V

    .line 144
    .end local v0           #in:Ljava/io/InputStream;
    .end local v1           #n:I
    :cond_2
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/UnionInputStream;->head()Ljava/io/InputStream;

    move-result-object v0

    .line 145
    .restart local v0       #in:Ljava/io/InputStream;
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 146
    .restart local v1       #n:I
    if-gtz v1, :cond_0

    .line 148
    sget-object v2, Lorg/eclipse/jgit/util/io/UnionInputStream;->EOF:Ljava/io/InputStream;

    if-ne v0, v2, :cond_1

    .line 149
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public skip(J)J
    .locals 13
    .parameter "count"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v11, 0x1

    const-wide/16 v9, 0x0

    .line 162
    const-wide/16 v6, 0x0

    .line 163
    .local v6, skipped:J
    move-wide v0, p1

    .line 164
    .local v0, cnt:J
    :cond_0
    :goto_0
    cmp-long v8, v9, v0

    if-gez v8, :cond_2

    .line 165
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/UnionInputStream;->head()Ljava/io/InputStream;

    move-result-object v2

    .line 166
    .local v2, in:Ljava/io/InputStream;
    invoke-virtual {v2, v0, v1}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v3

    .line 167
    .local v3, n:J
    cmp-long v8, v9, v3

    if-gez v8, :cond_1

    .line 168
    add-long/2addr v6, v3

    .line 169
    sub-long/2addr v0, v3

    goto :goto_0

    .line 171
    :cond_1
    sget-object v8, Lorg/eclipse/jgit/util/io/UnionInputStream;->EOF:Ljava/io/InputStream;

    if-ne v2, v8, :cond_3

    .line 190
    .end local v2           #in:Ljava/io/InputStream;
    .end local v3           #n:J
    :cond_2
    :goto_1
    return-wide v6

    .line 179
    .restart local v2       #in:Ljava/io/InputStream;
    .restart local v3       #n:J
    :cond_3
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v5

    .line 180
    .local v5, r:I
    if-gez v5, :cond_4

    .line 181
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/UnionInputStream;->pop()V

    .line 182
    cmp-long v8, v9, v6

    if-gez v8, :cond_0

    goto :goto_1

    .line 185
    :cond_4
    add-long/2addr v6, v11

    .line 186
    sub-long/2addr v0, v11

    goto :goto_0
.end method
