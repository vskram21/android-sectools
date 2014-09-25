.class public interface abstract Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;
.super Ljava/lang/Object;
.source "UploadPack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/UploadPack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "RequestValidator"
.end annotation


# virtual methods
.method public abstract checkWants(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/UploadPack;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/PackProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
