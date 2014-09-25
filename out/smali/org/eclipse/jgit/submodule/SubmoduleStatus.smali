.class public Lorg/eclipse/jgit/submodule/SubmoduleStatus;
.super Ljava/lang/Object;
.source "SubmoduleStatus.java"


# instance fields
.field private final headId:Lorg/eclipse/jgit/lib/ObjectId;

.field private final indexId:Lorg/eclipse/jgit/lib/ObjectId;

.field private final path:Ljava/lang/String;

.field private final type:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/submodule/SubmoduleStatusType;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 1
    .parameter "type"
    .parameter "path"
    .parameter "indexId"

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/submodule/SubmoduleStatus;-><init>(Lorg/eclipse/jgit/submodule/SubmoduleStatusType;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/submodule/SubmoduleStatusType;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 0
    .parameter "type"
    .parameter "path"
    .parameter "indexId"
    .parameter "headId"

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p1, p0, Lorg/eclipse/jgit/submodule/SubmoduleStatus;->type:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    .line 83
    iput-object p2, p0, Lorg/eclipse/jgit/submodule/SubmoduleStatus;->path:Ljava/lang/String;

    .line 84
    iput-object p3, p0, Lorg/eclipse/jgit/submodule/SubmoduleStatus;->indexId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 85
    iput-object p4, p0, Lorg/eclipse/jgit/submodule/SubmoduleStatus;->headId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 86
    return-void
.end method


# virtual methods
.method public getHeadId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleStatus;->headId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getIndexId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleStatus;->indexId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleStatus;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lorg/eclipse/jgit/submodule/SubmoduleStatusType;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleStatus;->type:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    return-object v0
.end method
