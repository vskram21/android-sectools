.class Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;
.super Lorg/eclipse/jgit/revwalk/filter/AndRevFilter;
.source "AndRevFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/filter/AndRevFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Binary"
.end annotation


# instance fields
.field private final a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

.field private final b:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

.field private final requiresCommitBody:Z


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/filter/RevFilter;Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V
    .locals 1
    .parameter "one"
    .parameter "two"

    .prologue
    .line 125
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter;-><init>()V

    .line 126
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 127
    iput-object p2, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->b:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 128
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->requiresCommitBody()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->b:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->requiresCommitBody()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->requiresCommitBody:Z

    .line 130
    return-void

    .line 128
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 118
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 3

    .prologue
    .line 146
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->b:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;-><init>(Lorg/eclipse/jgit/revwalk/filter/RevFilter;Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 1
    .parameter "walker"
    .parameter "c"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->b:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public requiresCommitBody()Z
    .locals 1

    .prologue
    .line 141
    iget-boolean v0, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->requiresCommitBody:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->a:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$Binary;->b:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
