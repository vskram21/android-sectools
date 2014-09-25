.class public Lorg/eclipse/jgit/transport/TrackingRefUpdate;
.super Ljava/lang/Object;
.source "TrackingRefUpdate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/TrackingRefUpdate$1;,
        Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;
    }
.end annotation


# instance fields
.field private cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;

.field private forceUpdate:Z

.field private final localName:Ljava/lang/String;

.field private newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

.field private oldObjectId:Lorg/eclipse/jgit/lib/ObjectId;

.field private final remoteName:Ljava/lang/String;

.field private result:Lorg/eclipse/jgit/lib/RefUpdate$Result;


# direct methods
.method constructor <init>(ZLjava/lang/String;Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "canForceUpdate"
    .parameter "remoteName"
    .parameter "localName"
    .parameter "oldValue"
    .parameter "newValue"

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p2, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->remoteName:Ljava/lang/String;

    .line 70
    iput-object p3, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->localName:Ljava/lang/String;

    .line 71
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->forceUpdate:Z

    .line 72
    invoke-virtual {p4}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->oldObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 73
    invoke-virtual {p5}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 74
    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "x0"

    .prologue
    .line 53
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->oldObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "x0"

    .prologue
    .line 53
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 53
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->localName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 53
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->forceUpdate:Z

    return v0
.end method

.method static synthetic access$502(Lorg/eclipse/jgit/transport/TrackingRefUpdate;Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 53
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    return-object p1
.end method


# virtual methods
.method public asReceiveCommand()Lorg/eclipse/jgit/transport/ReceiveCommand;
    .locals 2

    .prologue
    .line 139
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;

    if-nez v0, :cond_0

    .line 140
    new-instance v0, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;-><init>(Lorg/eclipse/jgit/transport/TrackingRefUpdate;Lorg/eclipse/jgit/transport/TrackingRefUpdate$1;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 141
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;

    return-object v0
.end method

.method public getLocalName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->localName:Ljava/lang/String;

    return-object v0
.end method

.method public getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getOldObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->oldObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getRemoteName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->remoteName:Ljava/lang/String;

    return-object v0
.end method

.method public getResult()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    return-object v0
.end method

.method setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V
    .locals 0
    .parameter "result"

    .prologue
    .line 131
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 132
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v2, 0x7

    .line 207
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 208
    .local v0, sb:Ljava/lang/StringBuilder;
    const-string v1, "TrackingRefUpdate["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->remoteName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    const-string v1, " -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->localName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->forceUpdate:Z

    if-eqz v1, :cond_0

    .line 213
    const-string v1, " (forced)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    :cond_0
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->oldObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    if-nez v1, :cond_1

    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    if-nez v1, :cond_2

    const-string v1, ""

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 215
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->oldObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/ObjectId;->abbreviate(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 217
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/ObjectId;->abbreviate(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method
