.class public abstract Lorg/eclipse/jgit/lib/ObjectDatabase;
.super Ljava/lang/Object;
.source "ObjectDatabase.java"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    return-void
.end method


# virtual methods
.method public abstract close()V
.end method

.method public create()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    return-void
.end method

.method public exists()Z
    .locals 1

    .prologue
    .line 70
    const/4 v0, 0x1

    return v0
.end method

.method public has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 2
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectDatabase;->newReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    .line 125
    .local v0, or:Lorg/eclipse/jgit/lib/ObjectReader;
    :try_start_0
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/ObjectReader;->has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 127
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    return v1

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v1
.end method

.method public newCachedDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;
    .locals 0

    .prologue
    .line 191
    return-object p0
.end method

.method public abstract newInserter()Lorg/eclipse/jgit/lib/ObjectInserter;
.end method

.method public abstract newReader()Lorg/eclipse/jgit/lib/ObjectReader;
.end method

.method public open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 1
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/lib/ObjectDatabase;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    return-object v0
.end method

.method public open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 2
    .parameter "objectId"
    .parameter "typeHint"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 175
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectDatabase;->newReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    .line 177
    .local v0, or:Lorg/eclipse/jgit/lib/ObjectReader;
    :try_start_0
    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 179
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v1
.end method
