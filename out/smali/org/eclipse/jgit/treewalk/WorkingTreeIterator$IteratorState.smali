.class final Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;
.super Ljava/lang/Object;
.source "WorkingTreeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "IteratorState"
.end annotation


# instance fields
.field contentDigest:Ljava/security/MessageDigest;

.field contentReadBuffer:[B

.field dirCacheTree:I

.field final nameEncoder:Ljava/nio/charset/CharsetEncoder;

.field final options:Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;

.field walk:Lorg/eclipse/jgit/treewalk/TreeWalk;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;)V
    .locals 1
    .parameter "options"

    .prologue
    .line 1220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1221
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->options:Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;

    .line 1222
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->nameEncoder:Ljava/nio/charset/CharsetEncoder;

    .line 1223
    return-void
.end method


# virtual methods
.method initializeDigestAndReadBuffer()V
    .locals 1

    .prologue
    .line 1226
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->contentDigest:Ljava/security/MessageDigest;

    if-nez v0, :cond_0

    .line 1227
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->contentDigest:Ljava/security/MessageDigest;

    .line 1228
    const/16 v0, 0x800

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->contentReadBuffer:[B

    .line 1230
    :cond_0
    return-void
.end method
