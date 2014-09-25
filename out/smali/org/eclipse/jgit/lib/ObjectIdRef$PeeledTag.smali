.class public Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;
.super Lorg/eclipse/jgit/lib/ObjectIdRef;
.source "ObjectIdRef.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/ObjectIdRef;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PeeledTag"
.end annotation


# instance fields
.field private final peeledObjectId:Lorg/eclipse/jgit/lib/ObjectId;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 0
    .parameter "st"
    .parameter "name"
    .parameter "id"
    .parameter "p"

    .prologue
    .line 92
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/lib/ObjectIdRef;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 93
    iput-object p4, p0, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;->peeledObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 94
    return-void
.end method


# virtual methods
.method public getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;->peeledObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public isPeeled()Z
    .locals 1

    .prologue
    .line 101
    const/4 v0, 0x1

    return v0
.end method
