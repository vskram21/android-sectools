.class public abstract Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
.super Lorg/eclipse/jgit/lib/ObjectId;
.source "ObjectIdOwnerMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Entry"
.end annotation


# instance fields
.field next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter "id"

    .prologue
    .line 353
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 354
    return-void
.end method
