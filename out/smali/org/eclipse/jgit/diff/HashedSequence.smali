.class public final Lorg/eclipse/jgit/diff/HashedSequence;
.super Lorg/eclipse/jgit/diff/Sequence;
.source "HashedSequence.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lorg/eclipse/jgit/diff/Sequence;",
        ">",
        "Lorg/eclipse/jgit/diff/Sequence;"
    }
.end annotation


# instance fields
.field final base:Lorg/eclipse/jgit/diff/Sequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field final hashes:[I


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/diff/Sequence;[I)V
    .locals 0
    .parameter
    .parameter "hashes"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;[I)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, this:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    .local p1, base:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/Sequence;-><init>()V

    .line 64
    iput-object p1, p0, Lorg/eclipse/jgit/diff/HashedSequence;->base:Lorg/eclipse/jgit/diff/Sequence;

    .line 65
    iput-object p2, p0, Lorg/eclipse/jgit/diff/HashedSequence;->hashes:[I

    .line 66
    return-void
.end method


# virtual methods
.method public size()I
    .locals 1

    .prologue
    .line 70
    .local p0, this:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/diff/HashedSequence;->base:Lorg/eclipse/jgit/diff/Sequence;

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v0

    return v0
.end method
