.class public final Lorg/eclipse/jgit/transport/UploadPack$AnyRequestValidator;
.super Ljava/lang/Object;
.source "UploadPack.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/UploadPack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AnyRequestValidator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkWants(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/List;)V
    .locals 0
    .parameter "up"
    .parameter
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

    .prologue
    .line 1158
    .local p2, wants:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    return-void
.end method
