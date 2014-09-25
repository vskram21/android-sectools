.class public interface abstract Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;
.super Ljava/lang/Object;
.source "ObjectReuseAsIs.java"


# virtual methods
.method public abstract copyObjectAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
        }
    .end annotation
.end method

.method public abstract copyPackAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/CachedPack;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getCachedPacksAndUpdate(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/CachedPack;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract newObjectToPack(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
.end method

.method public abstract selectObjectRepresentation(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/Iterable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter;",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;
        }
    .end annotation
.end method

.method public abstract writeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
