.class Lorg/eclipse/jgit/merge/MergeConfig$MergeConfigSectionParser;
.super Ljava/lang/Object;
.source "MergeConfig.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/Config$SectionParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/merge/MergeConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MergeConfigSectionParser"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/eclipse/jgit/lib/Config$SectionParser",
        "<",
        "Lorg/eclipse/jgit/merge/MergeConfig;",
        ">;"
    }
.end annotation


# instance fields
.field private final branch:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "branch"

    .prologue
    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    iput-object p1, p0, Lorg/eclipse/jgit/merge/MergeConfig$MergeConfigSectionParser;->branch:Ljava/lang/String;

    .line 168
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .parameter "obj"

    .prologue
    .line 176
    instance-of v0, p1, Lorg/eclipse/jgit/merge/MergeConfig$MergeConfigSectionParser;

    if-eqz v0, :cond_0

    .line 177
    iget-object v0, p0, Lorg/eclipse/jgit/merge/MergeConfig$MergeConfigSectionParser;->branch:Ljava/lang/String;

    check-cast p1, Lorg/eclipse/jgit/merge/MergeConfig$MergeConfigSectionParser;

    .end local p1
    iget-object v1, p1, Lorg/eclipse/jgit/merge/MergeConfig$MergeConfigSectionParser;->branch:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 179
    :goto_0
    return v0

    .restart local p1
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lorg/eclipse/jgit/merge/MergeConfig$MergeConfigSectionParser;->branch:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public bridge synthetic parse(Lorg/eclipse/jgit/lib/Config;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 161
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/merge/MergeConfig$MergeConfigSectionParser;->parse(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/merge/MergeConfig;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/merge/MergeConfig;
    .locals 3
    .parameter "cfg"

    .prologue
    .line 171
    new-instance v0, Lorg/eclipse/jgit/merge/MergeConfig;

    iget-object v1, p0, Lorg/eclipse/jgit/merge/MergeConfig$MergeConfigSectionParser;->branch:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, v2}, Lorg/eclipse/jgit/merge/MergeConfig;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/merge/MergeConfig$1;)V

    return-object v0
.end method
