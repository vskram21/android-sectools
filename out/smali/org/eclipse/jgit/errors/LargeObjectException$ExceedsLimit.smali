.class public Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;
.super Lorg/eclipse/jgit/errors/LargeObjectException;
.source "LargeObjectException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/errors/LargeObjectException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExceedsLimit"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final limit:J

.field private final size:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 0
    .parameter "limit"
    .parameter "size"

    .prologue
    .line 152
    invoke-direct {p0}, Lorg/eclipse/jgit/errors/LargeObjectException;-><init>()V

    .line 153
    iput-wide p1, p0, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;->limit:J

    .line 154
    iput-wide p3, p0, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;->size:J

    .line 155
    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 5

    .prologue
    .line 159
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->largeObjectExceedsLimit:Ljava/lang/String;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;->getObjectName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-wide v3, p0, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;->limit:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-wide v3, p0, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;->size:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
