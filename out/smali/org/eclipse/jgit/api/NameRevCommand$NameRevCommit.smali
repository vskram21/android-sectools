.class Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;
.super Lorg/eclipse/jgit/revwalk/RevCommit;
.source "NameRevCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/NameRevCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NameRevCommit"
.end annotation


# instance fields
.field private cost:J

.field private distance:I

.field private tip:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter "id"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 90
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/api/NameRevCommand$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 83
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 83
    iget-wide v0, p0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->cost:J

    return-wide v0
.end method

.method static synthetic access$102(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 83
    iput-wide p1, p0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->cost:J

    return-wide p1
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 83
    iget-object v0, p0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 83
    iput-object p1, p0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)Ljava/lang/StringBuilder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 83
    invoke-direct {p0}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->format()Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 83
    iget v0, p0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->distance:I

    return v0
.end method

.method static synthetic access$402(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 83
    iput p1, p0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->distance:I

    return p1
.end method

.method private format()Ljava/lang/StringBuilder;
    .locals 3

    .prologue
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .local v0, sb:Ljava/lang/StringBuilder;
    iget v1, p0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->distance:I

    if-lez v1, :cond_0

    .line 95
    const/16 v1, 0x7e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->distance:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    :cond_0
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 101
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 103
    .local v0, sb:Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 104
    invoke-direct {p0}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->format()Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 107
    :goto_0
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->cost:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 106
    :cond_0
    const/4 v1, 0x0

    check-cast v1, Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method
