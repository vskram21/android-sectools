.class public Lorg/eclipse/jgit/util/FS$Attributes;
.super Ljava/lang/Object;
.source "FS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/FS;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Attributes"
.end annotation


# instance fields
.field private creationTime:J

.field private exists:Z

.field private file:Ljava/io/File;

.field fs:Lorg/eclipse/jgit/util/FS;

.field private isDirectory:Z

.field private isExecutable:Z

.field private isRegularFile:Z

.field private isSymbolicLink:Z

.field private lastModifiedTime:J

.field protected length:J


# direct methods
.method public constructor <init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V
    .locals 2
    .parameter "path"
    .parameter "fs"

    .prologue
    .line 733
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 707
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->length:J

    .line 734
    iput-object p1, p0, Lorg/eclipse/jgit/util/FS$Attributes;->file:Ljava/io/File;

    .line 735
    iput-object p2, p0, Lorg/eclipse/jgit/util/FS$Attributes;->fs:Lorg/eclipse/jgit/util/FS;

    .line 736
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/util/FS;Ljava/io/File;ZZZZZJJJ)V
    .locals 2
    .parameter "fs"
    .parameter "file"
    .parameter "exists"
    .parameter "isDirectory"
    .parameter "isExecutable"
    .parameter "isSymbolicLink"
    .parameter "isRegularFile"
    .parameter "creationTime"
    .parameter "lastModifiedTime"
    .parameter "length"

    .prologue
    .line 714
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 707
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->length:J

    .line 715
    iput-object p1, p0, Lorg/eclipse/jgit/util/FS$Attributes;->fs:Lorg/eclipse/jgit/util/FS;

    .line 716
    iput-object p2, p0, Lorg/eclipse/jgit/util/FS$Attributes;->file:Ljava/io/File;

    .line 717
    iput-boolean p3, p0, Lorg/eclipse/jgit/util/FS$Attributes;->exists:Z

    .line 718
    iput-boolean p4, p0, Lorg/eclipse/jgit/util/FS$Attributes;->isDirectory:Z

    .line 719
    iput-boolean p5, p0, Lorg/eclipse/jgit/util/FS$Attributes;->isExecutable:Z

    .line 720
    iput-boolean p6, p0, Lorg/eclipse/jgit/util/FS$Attributes;->isSymbolicLink:Z

    .line 721
    iput-boolean p7, p0, Lorg/eclipse/jgit/util/FS$Attributes;->isRegularFile:Z

    .line 722
    iput-wide p8, p0, Lorg/eclipse/jgit/util/FS$Attributes;->creationTime:J

    .line 723
    iput-wide p10, p0, Lorg/eclipse/jgit/util/FS$Attributes;->lastModifiedTime:J

    .line 724
    iput-wide p12, p0, Lorg/eclipse/jgit/util/FS$Attributes;->length:J

    .line 725
    return-void
.end method


# virtual methods
.method exists()Z
    .locals 1

    .prologue
    .line 762
    iget-boolean v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->exists:Z

    return v0
.end method

.method public getCreationTime()J
    .locals 2

    .prologue
    .line 677
    iget-wide v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->creationTime:J

    return-wide v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 758
    iget-object v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->file:Ljava/io/File;

    return-object v0
.end method

.method public getLastModifiedTime()J
    .locals 2

    .prologue
    .line 685
    iget-wide v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->lastModifiedTime:J

    return-wide v0
.end method

.method public getLength()J
    .locals 4

    .prologue
    .line 742
    iget-wide v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->length:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 743
    iget-object v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->length:J

    .line 744
    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->length:J

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 751
    iget-object v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isDirectory()Z
    .locals 1

    .prologue
    .line 649
    iget-boolean v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->isDirectory:Z

    return v0
.end method

.method public isExecutable()Z
    .locals 1

    .prologue
    .line 656
    iget-boolean v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->isExecutable:Z

    return v0
.end method

.method public isRegularFile()Z
    .locals 1

    .prologue
    .line 670
    iget-boolean v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->isRegularFile:Z

    return v0
.end method

.method public isSymbolicLink()Z
    .locals 1

    .prologue
    .line 663
    iget-boolean v0, p0, Lorg/eclipse/jgit/util/FS$Attributes;->isSymbolicLink:Z

    return v0
.end method
