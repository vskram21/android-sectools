.class public Lorg/eclipse/jgit/api/Git;
.super Ljava/lang/Object;
.source "Git.java"


# instance fields
.field private final repo:Lorg/eclipse/jgit/lib/Repository;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 194
    if-nez p1, :cond_0

    .line 195
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 196
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    .line 197
    return-void
.end method

.method public static cloneRepository()Lorg/eclipse/jgit/api/CloneCommand;
    .locals 1

    .prologue
    .line 157
    new-instance v0, Lorg/eclipse/jgit/api/CloneCommand;

    invoke-direct {v0}, Lorg/eclipse/jgit/api/CloneCommand;-><init>()V

    return-object v0
.end method

.method public static init()Lorg/eclipse/jgit/api/InitCommand;
    .locals 1

    .prologue
    .line 181
    new-instance v0, Lorg/eclipse/jgit/api/InitCommand;

    invoke-direct {v0}, Lorg/eclipse/jgit/api/InitCommand;-><init>()V

    return-object v0
.end method

.method public static lsRemoteRepository()Lorg/eclipse/jgit/api/LsRemoteCommand;
    .locals 2

    .prologue
    .line 168
    new-instance v0, Lorg/eclipse/jgit/api/LsRemoteCommand;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/LsRemoteCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public static open(Ljava/io/File;)Lorg/eclipse/jgit/api/Git;
    .locals 1
    .parameter "dir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    sget-object v0, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    invoke-static {p0, v0}, Lorg/eclipse/jgit/api/Git;->open(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/api/Git;

    move-result-object v0

    return-object v0
.end method

.method public static open(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/api/Git;
    .locals 3
    .parameter "dir"
    .parameter "fs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    invoke-static {p0, p1}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->lenient(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;

    move-result-object v0

    .line 113
    .local v0, key:Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    new-instance v1, Lorg/eclipse/jgit/lib/RepositoryBuilder;

    invoke-direct {v1}, Lorg/eclipse/jgit/lib/RepositoryBuilder;-><init>()V

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->setFS(Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/RepositoryBuilder;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->getFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/RepositoryBuilder;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->setMustExist(Z)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/RepositoryBuilder;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->build()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/api/Git;->wrap(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/api/Git;

    move-result-object v1

    return-object v1
.end method

.method public static wrap(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/api/Git;
    .locals 1
    .parameter "repo"

    .prologue
    .line 124
    new-instance v0, Lorg/eclipse/jgit/api/Git;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method


# virtual methods
.method public add()Lorg/eclipse/jgit/api/AddCommand;
    .locals 2

    .prologue
    .line 303
    new-instance v0, Lorg/eclipse/jgit/api/AddCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/AddCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public apply()Lorg/eclipse/jgit/api/ApplyCommand;
    .locals 2

    .prologue
    .line 658
    new-instance v0, Lorg/eclipse/jgit/api/ApplyCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/ApplyCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public archive()Lorg/eclipse/jgit/api/ArchiveCommand;
    .locals 2

    .prologue
    .line 443
    new-instance v0, Lorg/eclipse/jgit/api/ArchiveCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/ArchiveCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public blame()Lorg/eclipse/jgit/api/BlameCommand;
    .locals 2

    .prologue
    .line 518
    new-instance v0, Lorg/eclipse/jgit/api/BlameCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/BlameCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public branchCreate()Lorg/eclipse/jgit/api/CreateBranchCommand;
    .locals 2

    .prologue
    .line 253
    new-instance v0, Lorg/eclipse/jgit/api/CreateBranchCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/CreateBranchCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public branchDelete()Lorg/eclipse/jgit/api/DeleteBranchCommand;
    .locals 2

    .prologue
    .line 262
    new-instance v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/DeleteBranchCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public branchList()Lorg/eclipse/jgit/api/ListBranchCommand;
    .locals 2

    .prologue
    .line 271
    new-instance v0, Lorg/eclipse/jgit/api/ListBranchCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/ListBranchCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public branchRename()Lorg/eclipse/jgit/api/RenameBranchCommand;
    .locals 2

    .prologue
    .line 290
    new-instance v0, Lorg/eclipse/jgit/api/RenameBranchCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RenameBranchCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public checkout()Lorg/eclipse/jgit/api/CheckoutCommand;
    .locals 2

    .prologue
    .line 407
    new-instance v0, Lorg/eclipse/jgit/api/CheckoutCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/CheckoutCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public cherryPick()Lorg/eclipse/jgit/api/CherryPickCommand;
    .locals 2

    .prologue
    .line 355
    new-instance v0, Lorg/eclipse/jgit/api/CherryPickCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/CherryPickCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public clean()Lorg/eclipse/jgit/api/CleanCommand;
    .locals 2

    .prologue
    .line 505
    new-instance v0, Lorg/eclipse/jgit/api/CleanCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/CleanCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public close()V
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 145
    :cond_0
    return-void
.end method

.method public commit()Lorg/eclipse/jgit/api/CommitCommand;
    .locals 2

    .prologue
    .line 209
    new-instance v0, Lorg/eclipse/jgit/api/CommitCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/CommitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public describe()Lorg/eclipse/jgit/api/DescribeCommand;
    .locals 2

    .prologue
    .line 694
    new-instance v0, Lorg/eclipse/jgit/api/DescribeCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/DescribeCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public diff()Lorg/eclipse/jgit/api/DiffCommand;
    .locals 2

    .prologue
    .line 544
    new-instance v0, Lorg/eclipse/jgit/api/DiffCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/DiffCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public fetch()Lorg/eclipse/jgit/api/FetchCommand;
    .locals 2

    .prologue
    .line 329
    new-instance v0, Lorg/eclipse/jgit/api/FetchCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/FetchCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public gc()Lorg/eclipse/jgit/api/GarbageCollectCommand;
    .locals 2

    .prologue
    .line 673
    new-instance v0, Lorg/eclipse/jgit/api/GarbageCollectCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/GarbageCollectCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 701
    iget-object v0, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    return-object v0
.end method

.method public log()Lorg/eclipse/jgit/api/LogCommand;
    .locals 2

    .prologue
    .line 222
    new-instance v0, Lorg/eclipse/jgit/api/LogCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/LogCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public lsRemote()Lorg/eclipse/jgit/api/LsRemoteCommand;
    .locals 2

    .prologue
    .line 492
    new-instance v0, Lorg/eclipse/jgit/api/LsRemoteCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/LsRemoteCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public merge()Lorg/eclipse/jgit/api/MergeCommand;
    .locals 2

    .prologue
    .line 235
    new-instance v0, Lorg/eclipse/jgit/api/MergeCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/MergeCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public nameRev()Lorg/eclipse/jgit/api/NameRevCommand;
    .locals 2

    .prologue
    .line 683
    new-instance v0, Lorg/eclipse/jgit/api/NameRevCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/NameRevCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public notesAdd()Lorg/eclipse/jgit/api/AddNoteCommand;
    .locals 2

    .prologue
    .line 452
    new-instance v0, Lorg/eclipse/jgit/api/AddNoteCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/AddNoteCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public notesList()Lorg/eclipse/jgit/api/ListNotesCommand;
    .locals 2

    .prologue
    .line 470
    new-instance v0, Lorg/eclipse/jgit/api/ListNotesCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/ListNotesCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public notesRemove()Lorg/eclipse/jgit/api/RemoveNoteCommand;
    .locals 2

    .prologue
    .line 461
    new-instance v0, Lorg/eclipse/jgit/api/RemoveNoteCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RemoveNoteCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public notesShow()Lorg/eclipse/jgit/api/ShowNoteCommand;
    .locals 2

    .prologue
    .line 479
    new-instance v0, Lorg/eclipse/jgit/api/ShowNoteCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/ShowNoteCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public pull()Lorg/eclipse/jgit/api/PullCommand;
    .locals 2

    .prologue
    .line 244
    new-instance v0, Lorg/eclipse/jgit/api/PullCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/PullCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public push()Lorg/eclipse/jgit/api/PushCommand;
    .locals 2

    .prologue
    .line 342
    new-instance v0, Lorg/eclipse/jgit/api/PushCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/PushCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public rebase()Lorg/eclipse/jgit/api/RebaseCommand;
    .locals 2

    .prologue
    .line 381
    new-instance v0, Lorg/eclipse/jgit/api/RebaseCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public reflog()Lorg/eclipse/jgit/api/ReflogCommand;
    .locals 2

    .prologue
    .line 531
    new-instance v0, Lorg/eclipse/jgit/api/ReflogCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/ReflogCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public reset()Lorg/eclipse/jgit/api/ResetCommand;
    .locals 2

    .prologue
    .line 420
    new-instance v0, Lorg/eclipse/jgit/api/ResetCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/ResetCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public revert()Lorg/eclipse/jgit/api/RevertCommand;
    .locals 2

    .prologue
    .line 368
    new-instance v0, Lorg/eclipse/jgit/api/RevertCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RevertCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public rm()Lorg/eclipse/jgit/api/RmCommand;
    .locals 2

    .prologue
    .line 394
    new-instance v0, Lorg/eclipse/jgit/api/RmCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RmCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public stashApply()Lorg/eclipse/jgit/api/StashApplyCommand;
    .locals 2

    .prologue
    .line 633
    new-instance v0, Lorg/eclipse/jgit/api/StashApplyCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/StashApplyCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public stashCreate()Lorg/eclipse/jgit/api/StashCreateCommand;
    .locals 2

    .prologue
    .line 623
    new-instance v0, Lorg/eclipse/jgit/api/StashCreateCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/StashCreateCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public stashDrop()Lorg/eclipse/jgit/api/StashDropCommand;
    .locals 2

    .prologue
    .line 643
    new-instance v0, Lorg/eclipse/jgit/api/StashDropCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/StashDropCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public stashList()Lorg/eclipse/jgit/api/StashListCommand;
    .locals 2

    .prologue
    .line 613
    new-instance v0, Lorg/eclipse/jgit/api/StashListCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/StashListCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public status()Lorg/eclipse/jgit/api/StatusCommand;
    .locals 2

    .prologue
    .line 433
    new-instance v0, Lorg/eclipse/jgit/api/StatusCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/StatusCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public submoduleAdd()Lorg/eclipse/jgit/api/SubmoduleAddCommand;
    .locals 2

    .prologue
    .line 563
    new-instance v0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/SubmoduleAddCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public submoduleInit()Lorg/eclipse/jgit/api/SubmoduleInitCommand;
    .locals 2

    .prologue
    .line 574
    new-instance v0, Lorg/eclipse/jgit/api/SubmoduleInitCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/SubmoduleInitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public submoduleStatus()Lorg/eclipse/jgit/api/SubmoduleStatusCommand;
    .locals 2

    .prologue
    .line 584
    new-instance v0, Lorg/eclipse/jgit/api/SubmoduleStatusCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/SubmoduleStatusCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public submoduleSync()Lorg/eclipse/jgit/api/SubmoduleSyncCommand;
    .locals 2

    .prologue
    .line 594
    new-instance v0, Lorg/eclipse/jgit/api/SubmoduleSyncCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/SubmoduleSyncCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public submoduleUpdate()Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;
    .locals 2

    .prologue
    .line 604
    new-instance v0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public tag()Lorg/eclipse/jgit/api/TagCommand;
    .locals 2

    .prologue
    .line 316
    new-instance v0, Lorg/eclipse/jgit/api/TagCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/TagCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public tagDelete()Lorg/eclipse/jgit/api/DeleteTagCommand;
    .locals 2

    .prologue
    .line 553
    new-instance v0, Lorg/eclipse/jgit/api/DeleteTagCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/DeleteTagCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public tagList()Lorg/eclipse/jgit/api/ListTagCommand;
    .locals 2

    .prologue
    .line 281
    new-instance v0, Lorg/eclipse/jgit/api/ListTagCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/Git;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/ListTagCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method
