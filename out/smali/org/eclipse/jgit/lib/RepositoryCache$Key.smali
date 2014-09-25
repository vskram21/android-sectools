.class public interface abstract Lorg/eclipse/jgit/lib/RepositoryCache$Key;
.super Ljava/lang/Object;
.source "RepositoryCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/RepositoryCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Key"
.end annotation


# virtual methods
.method public abstract open(Z)Lorg/eclipse/jgit/lib/Repository;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/RepositoryNotFoundException;
        }
    .end annotation
.end method
