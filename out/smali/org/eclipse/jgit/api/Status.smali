.class public Lorg/eclipse/jgit/api/Status;
.super Ljava/lang/Object;
.source "Status.java"


# instance fields
.field private final clean:Z

.field private final diff:Lorg/eclipse/jgit/lib/IndexDiff;

.field private final hasUncommittedChanges:Z


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/IndexDiff;)V
    .locals 3
    .parameter "diff"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    .line 78
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/IndexDiff;->getAdded()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/IndexDiff;->getChanged()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/IndexDiff;->getRemoved()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/IndexDiff;->getMissing()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/IndexDiff;->getModified()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/IndexDiff;->getConflicting()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Lorg/eclipse/jgit/api/Status;->hasUncommittedChanges:Z

    .line 84
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/Status;->hasUncommittedChanges:Z

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/IndexDiff;->getUntracked()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    :goto_1
    iput-boolean v2, p0, Lorg/eclipse/jgit/api/Status;->clean:Z

    .line 86
    return-void

    :cond_1
    move v0, v1

    .line 78
    goto :goto_0

    :cond_2
    move v2, v1

    .line 84
    goto :goto_1
.end method


# virtual methods
.method public getAdded()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/IndexDiff;->getAdded()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getChanged()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/IndexDiff;->getChanged()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getConflicting()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 167
    iget-object v0, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/IndexDiff;->getConflicting()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getConflictingStageState()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/IndexDiff$StageState;",
            ">;"
        }
    .end annotation

    .prologue
    .line 175
    iget-object v0, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/IndexDiff;->getConflictingStageStates()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getIgnoredNotInIndex()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 182
    iget-object v0, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/IndexDiff;->getIgnoredNotInIndex()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getMissing()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 134
    iget-object v0, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/IndexDiff;->getMissing()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getModified()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 143
    iget-object v0, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/IndexDiff;->getModified()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getRemoved()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 126
    iget-object v0, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/IndexDiff;->getRemoved()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getUncommittedChanges()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 192
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 193
    .local v0, uncommittedChanges:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/IndexDiff;->getAdded()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 194
    iget-object v1, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/IndexDiff;->getChanged()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 195
    iget-object v1, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/IndexDiff;->getRemoved()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 196
    iget-object v1, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/IndexDiff;->getMissing()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 197
    iget-object v1, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/IndexDiff;->getModified()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 198
    iget-object v1, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/IndexDiff;->getConflicting()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 199
    return-object v0
.end method

.method public getUntracked()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 152
    iget-object v0, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/IndexDiff;->getUntracked()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getUntrackedFolders()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 159
    iget-object v0, p0, Lorg/eclipse/jgit/api/Status;->diff:Lorg/eclipse/jgit/lib/IndexDiff;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/IndexDiff;->getUntrackedFolders()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public hasUncommittedChanges()Z
    .locals 1

    .prologue
    .line 102
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/Status;->hasUncommittedChanges:Z

    return v0
.end method

.method public isClean()Z
    .locals 1

    .prologue
    .line 93
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/Status;->clean:Z

    return v0
.end method
