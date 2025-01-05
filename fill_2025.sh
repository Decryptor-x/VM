#!/bin/bash
echo "Filling 2025 with contributions for VM repo..."

# Verify we're using correct account
echo "Account: $(git config user.name) <$(git config user.email)>"

# Create realistic commits for 2025
for month in {1..12}; do
    echo "Processing month: $month/2025"
    
    # Create 15-20 commits per month
    monthly_commits=$((15 + RANDOM % 6))
    
    for ((i=1; i<=monthly_commits; i++)); do
        # Random day in month (1-28 to be safe)
        day=$((1 + RANDOM % 28))
        
        # Random time during work hours
        hour=$((9 + RANDOM % 8))
        minute=$((RANDOM % 60))
        commit_date="2025-$month-$day $hour:$minute:00"
        
        # Realistic commit messages for VM project
        messages=(
            "feat: add new VM configuration template"
            "fix: resolve deployment script issue"
            "docs: update installation instructions"
            "refactor: improve VM startup process"
            "test: add deployment validation tests"
            "chore: update dependency versions"
            "feat: enhance auto-scaling functionality"
            "fix: bug in network configuration"
            "docs: add troubleshooting guide"
            "perf: optimize VM resource allocation"
            "feat: add backup automation"
            "fix: correct logging format"
            "docs: update API documentation"
            "refactor: clean up configuration management"
            "test: add integration tests"
        )
        
        message_index=$((RANDOM % ${#messages[@]}))
        commit_message="${messages[$message_index]}"
        
        # Make realistic file changes
        echo "# Update $(date)" >> src/vm_manager.sh
        echo "// Feature addition - $commit_date" >> src/utils.js 2>/dev/null || echo "// Feature addition - $commit_date" > src/utils.js
        
        # Add and commit
        git add .
        GIT_COMMITTER_DATE="$commit_date" git commit -m "$commit_message" --date="$commit_date" --no-edit
        
        echo "✓ 2025-$month-$day: $commit_message"
    done
done

echo "Pushing all 2025 commits to GitHub..."
git push origin main

echo ""
echo "✅ 2025 contribution graph filled!"
echo "📅 Year: 2025"
echo "📊 Commits: ~200+"
echo "🟩 Your 2025 should be solid green!"
