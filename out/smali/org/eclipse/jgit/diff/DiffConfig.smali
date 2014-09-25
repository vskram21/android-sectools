.class public Lorg/eclipse/jgit/diff/DiffConfig;
.super Ljava/lang/Object;
.source "DiffConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;
    }
.end annotation


# static fields
.field public static final KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<",
            "Lorg/eclipse/jgit/diff/DiffConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final noPrefix:Z

.field private final renameDetectionType:Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;

.field private final renameLimit:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    new-instance v0, Lorg/eclipse/jgit/diff/DiffConfig$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/DiffConfig$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/diff/DiffConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/lib/Config;)V
    .locals 3
    .parameter "rc"

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    const-string v0, "diff"

    const-string v1, "noprefix"

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/diff/DiffConfig;->noPrefix:Z

    .line 84
    const-string v0, "diff"

    const/4 v1, 0x0

    const-string v2, "renames"

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/diff/DiffConfig;->parseRenameDetectionType(Ljava/lang/String;)Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/diff/DiffConfig;->renameDetectionType:Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;

    .line 86
    const-string v0, "diff"

    const-string v1, "renamelimit"

    const/16 v2, 0xc8

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/diff/DiffConfig;->renameLimit:I

    .line 88
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/diff/DiffConfig$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/DiffConfig;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    return-void
.end method

.method private static parseRenameDetectionType(Ljava/lang/String;)Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;
    .locals 6
    .parameter "renameString"

    .prologue
    .line 112
    if-nez p0, :cond_0

    .line 113
    sget-object v1, Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;->FALSE:Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;

    .line 132
    :goto_0
    return-object v1

    .line 114
    :cond_0
    const-string v1, "copy"

    invoke-static {v1, p0}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "copies"

    invoke-static {v1, p0}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 120
    :cond_1
    sget-object v1, Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;->COPY:Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;

    goto :goto_0

    .line 122
    :cond_2
    invoke-static {p0}, Lorg/eclipse/jgit/util/StringUtils;->toBooleanOrNull(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 124
    .local v0, renameBoolean:Ljava/lang/Boolean;
    if-nez v0, :cond_3

    .line 125
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->enumValueNotSupported2:Ljava/lang/String;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "diff"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "renames"

    aput-object v5, v3, v4

    const/4 v4, 0x2

    aput-object p0, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 129
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 130
    sget-object v1, Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;->TRUE:Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;

    goto :goto_0

    .line 132
    :cond_4
    sget-object v1, Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;->FALSE:Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;

    goto :goto_0
.end method


# virtual methods
.method public getRenameDetectionType()Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffConfig;->renameDetectionType:Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;

    return-object v0
.end method

.method public getRenameLimit()I
    .locals 1

    .prologue
    .line 107
    iget v0, p0, Lorg/eclipse/jgit/diff/DiffConfig;->renameLimit:I

    return v0
.end method

.method public isNoPrefix()Z
    .locals 1

    .prologue
    .line 92
    iget-boolean v0, p0, Lorg/eclipse/jgit/diff/DiffConfig;->noPrefix:Z

    return v0
.end method

.method public isRenameDetectionEnabled()Z
    .locals 2

    .prologue
    .line 97
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffConfig;->renameDetectionType:Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;

    sget-object v1, Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;->FALSE:Lorg/eclipse/jgit/diff/DiffConfig$RenameDetectionType;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
