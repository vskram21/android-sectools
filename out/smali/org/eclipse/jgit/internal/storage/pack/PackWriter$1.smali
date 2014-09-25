.class final Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1;
.super Ljava/lang/Object;
.source "PackWriter.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/eclipse/jgit/internal/storage/pack/PackWriter;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 175
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;-><init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1;)V

    return-object v0
.end method
